class EventsController < ApplicationController
	
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
		@event = Event.new(event_params)

		if @event.save 
			active_members = Member.where(active: true).order(last_name: :asc)
			@event.create_attendees_for(active_members, params[:mem])
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
		@event.update_attributes(get_event_params) ? render(:show) : render(:edit)
	end

	# TODO setup publish to create attendees for every member
	def publish
	end

	def destroy
		event = Event.find(params[:id])
		event.delete
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
