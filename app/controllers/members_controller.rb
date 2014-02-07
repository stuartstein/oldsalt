class MembersController < ApplicationController
	#before_filter :authenticate_member!
	
# TODO add members to attendees for all upcoming events
	def index
		current_member.is_admin ? redirect_to(members_dashboard_path) : redirect_to(events_path)
	end

	def new
		@member = Member.new()
	end

	def create
		@member = Member.create(get_member_params)
		redirect_to 'member_password'
	end

	def dashboard
		if current_member.is_admin
			@members = Member.all
			render :dashboard
		else
			route_to_events
		end
	end

	def show
		@member = Member.find(params[:id])
		if current_member.id == @member.id || current_member.is_admin
			@upcoming = @member.get_events("Live").order(start_date: :asc)
			@past = @member.get_events("Archived")
			render :show
		else
			route_to_events
		end
	end

	def deactivate
		@member = Member.find(params[:id])
		if current_member.id == @member.id || current_member.is_admin
			@member.update_attributes(status: "Inactive")
			flash[:success] = "This account has been deactivated! It will no longer be visible on our site."
		else
			route_to_events
		end
	end

	def update
		@member = Member.find(params[:id])
		if @member.update_attributes(get_member_params)
			flash[:info] = "Updated! Double-check it's everything you dreamed."
		 	redirect_to(member_path) 
		 else
		 	render(:edit)
		 end
	end

	def edit
		@member = Member.find(params[:id])
	end

end

private

def get_member_params
	params.require(:member).permit(:first_name, :last_name, :email, :address1, :address2, :city, :state, :zip, :role)
end

def route_to_events
	flash[:info] = "Sorry, you didn't have access to this page."
			redirect_to events_path
end