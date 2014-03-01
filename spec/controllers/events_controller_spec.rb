require 'spec_helper'
require 'event_helper'



describe EventsController do
	include Devise::TestHelpers

	before(:each) do 
    	@current_member = Member.create(:email => "stu@gmail.com", :password => "Welcome123")
    	sign_in @current_member
  	end

	describe "#index" do 
	
		context 'when index is found' do
		    it 'responds with 200'
		    it 'shows the index'
		end
		
	end
	
end