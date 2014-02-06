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

	def create_attendees_for(members)

		members.each do |m|

			if Attendee.find_by(member_id: m.id, event_id: id).nil?
				Attendee.create(event_id: id, member_id: m.id)
			end
			
		end
	end

	


end
