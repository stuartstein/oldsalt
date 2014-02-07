class EventsController < ApplicationController
	before_filter :authenticate_member!
	
	def index
		@upcoming_thumbs = Event.where(status: "Live").order(start_date: :asc)
		@draft_thumbs = Event.where(status: "Draft").order(start_date: :asc)
	end

	def new
		@event = Event.new()
		@active_members = Member.where(active: true).order(last_name: :asc)
	end

	def create
		event_params = get_event_params
		event_params[:start_date] = format_datetime(params[:start_day], params[:start_time])
		event_params[:end_date] = format_datetime(params[:end_day], params[:end_time])
		event_params[:status] = "Draft"
		@event = Event.new(event_params)

		if @event.save 
			params[:mem].each { | mem_id | Attendee.create(event_id: @event.id, member_id:  mem_id.to_i, is_lead: true, rsvp: "Yes") }
			flash[:info] = "Here's a preview of your event. Tweak until it's perfect!"
			redirect_to(@event) 
		else
			render(:new) 
		end
	end

	def show
		@event = Event.find(params[:id]) 
		@yeses = @event.get_members_rsvp("Yes")
		@nos = @event.get_members_rsvp("No")
	end
	
	def dashboard
		@upcoming_events = Event.where(status: "Live").order(start_date: :asc)
		@past_events = Event.where(status: "Archived").order(start_date: :desc)
		render 'dashboard'
	end

	def edit
		@event = Event.find(params[:id])
		@active_members = Member.where(active: true).order(last_name: :asc)
		@selected_ids = @event.get_leads.map { |lead| lead.id }
	end

	def update
		@event = Event.find(params[:id])
		@event.save
		flash[:info] = "Updated! Double-check to make sure it looks amazetastic."
		@event.update_attributes(get_event_params) ? redirect_to(event_path) : render(:edit)
	end

	def publish
		@event = Event.find(params[:id]) 
		active_members = Member.where(active: true).order(last_name: :asc)
		@event.create_attendees_for(active_members)
		@event.status = "Live"
		flash[:success] = "Your event is live! Time to get promoting."
		redirect_to event_path
	end

	def destroy
		event = Event.find(params[:id])
		event.delete
		flash[:success] = "That event is no more. Parting is sweet sorrow."
		redirect_to events_path
 	end

 	def manage
 		@event = Event.find(params[:id])
 		@attendees = @event.attendees
 	end

	private 
	def get_event_params
		params.require(:event).permit(:start_date, :end_date, :picture, :clue_url, :capacity, :price, :oldsalt_fee, :address1, :address2, :city, :state, :zip, :attire, :what_to_bring, :notes, :warnings, :description, :clue_text, :location_name, :map_url)
	end

	def format_datetime(d, t)
		d = Date.strptime(d, "%b %e, %Y")
		t = Time.strptime(t, "%l:%M %P")
		DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
	end


end
