class MembersController < ApplicationController
	#before_filter :authenticate_member!
	
# TODO add members to attendees for all upcoming events
	def index
		redirect_to '/members/dashboard'
	end

	def new
		@member = Member.new
	end


	def dashboard
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
		@upcoming = @member.get_events("Live").order(start_date: :asc)
		@past = @member.get_events("Archived")
	end

	def delete
	end

	def deactivate
	end

	def update
	end

	def edit
		@member = Member.find(params[:id])
	end


end
