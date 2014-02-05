class Event < ActiveRecord::Base
	# TODO Before save, check price doesn't have $ in it
	has_many :attendees
	has_many :members, through: :attendees

	def open_seats
		capacity - count_rsvps("Yes")
	end

	def count_rsvps(response)
		attendees.where(rsvp: response).count
	end

	def get_leads
		Member.joins("INNER JOIN attendees ON members.id = attendees.member_id WHERE attendees.event_id = #{id} AND attendees.is_lead = 't'")
	end

	def get_members_rsvp(response)
		Member.joins("INNER JOIN attendees ON members.id = attendees.member_id WHERE attendees.event_id = #{id} AND attendees.rsvp = '#{response}'")
	end

	def create_attendees_for(members, id_arr)
		members.each do |m|
			if id_arr.include?(m.id.to_s)

				lead = true 
				resp = "Yes"
			else
				lead = false
				resp = "Waiting"
			end
		 	Attendee.create(event_id: id, member_id: m.id, is_lead: lead, rsvp: resp)
		end
	end

	


end
