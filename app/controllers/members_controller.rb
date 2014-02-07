class MembersController < ApplicationController
	#before_filter :authenticate_member!
	
# TODO add members to attendees for all upcoming events
	def index
		redirect_to '/members/dashboard'
	end

	def new
		@member = Member.new()
	end

	def create
		@member = Member.create(get_member_params)
		redirect_to 'member_password'
	end

	def dashboard
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
		@upcoming = @member.get_events("Live").order(start_date: :asc)
		@past = @member.get_events("Archived")
	end

	def deactivate
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