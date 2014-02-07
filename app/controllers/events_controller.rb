class EventsController < ApplicationController
	#before_filter :authenticate_member!
	
	def index
		@upcoming_thumbs = Event.where(status: "Live").order(start_date: :asc)
		@draft_thumbs = current_member.get_drafts.order(start_date: :asc)
		current_member.update_attributes(active: true)
	end

	def new
		if current_member.is_admin
			@event = Event.new()
			@active_members = Member.where(active: true).order(last_name: :asc)
			render :new
		else
			route_to_events
		end
	end

	def create
		if current_member.is_admin
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
		else
			route_to_events
		end
	end

	def show
		@event = Event.find(params[:id]) 
		if (@event.status = "Draft" && !current_member.has_draft_access(@event.id)) || @event.nil?
			flash[:warning] = "Whoops! This page isn't ready yet. Check out our other events!"
			redirect_to events_path
		else
			@yeses = @event.get_members_rsvp("Yes")
			@nos = @event.get_members_rsvp("No")
		end
	end
	
	def dashboard
		if current_member.is_admin
			@upcoming_events = Event.where(status: "Live").order(start_date: :asc)
			@past_events = Event.where(status: "Archived").order(start_date: :desc)
			render 'dashboard'
		else
			route_to_events
		end
	end

	def edit
		@event = Event.find(params[:id])
		if current_member.is_admin || current_member.is_event_lead(@event.id)
			@active_members = Member.where(active: true).order(last_name: :asc)
			@selected_ids = @event.get_leads.map { |lead| lead.id }
		else
			route_to_events
		end
	end

	def update
		@event = Event.find(params[:id])
		if current_member.is_admin || current_member.is_event_lead(@event.id)
			@event.save
			flash[:info] = "Updated! Double-check to make sure it looks amazetastic."
			@event.update_attributes(get_event_params) ? redirect_to(event_path) : render(:edit)
		else
			route_to_events
		end
	end

	def publish
		@event = Event.find(params[:id])
		if current_member.is_admin || current_member.is_event_lead(@event.id)
			active_members = Member.where(active: true).order(last_name: :asc)
			@event.create_attendees_for(active_members)
			@event.status = "Live"
			flash[:success] = "Your event is live! Time to get promoting."
			redirect_to event_path
		else
			route_to_events
		end
	end

	def destroy
		event = Event.find(params[:id])
		if current_member.is_admin || current_member.is_event_lead(event.id)
			event.delete
			flash[:success] = "That event is no more. Parting is sweet sorrow."
			redirect_to events_path
		else
			route_to_events
		end
 	end

 	def manage
 		@event = Event.find(params[:id])
 		if current_member.is_admin || current_member.is_event_lead(@event.id)
 			@attendees = @event.attendees
 			render :manage
 		else
 			route_to_events
 		end
 	end

 	def nogo
 		Attendee.where(event_id: params[:id], member_id: current_member.id).first.rsvp = "No"
 		flash[:info] = "We're sorry you won't make it! Another time, maybe?"
 		redirect_to events_path
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

	def route_to_events
		flash[:info] = "Sorry, you didn't have access to this page."
		redirect_to events_path
	end
end