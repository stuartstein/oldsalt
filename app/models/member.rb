class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
# TODO set active/inactive member rules

	has_many :attendees
	has_many :events, through: :attendees

	def full_name
		"#{first_name} #{last_name}"
	end

	def get_attendee(event_id)
		attendees.find_by(event_id: event_id)
	end

	def active_print
		active ? "Active" : "Inactive"
	end

	def count_past_rsvps(response)
		Attendee.joins("INNER JOIN events ON attendees.event_id = events.id WHERE attendees.member_id = #{id} AND attendees.rsvp = '#{response}' AND events.status = 'Archived'").count
	end

	def get_events(status)
		Event.joins("INNER JOIN attendees ON attendees.event_id = events.id WHERE attendees.member_id = #{id} AND events.status = '#{status}'")
	end

	def get_drafts()
		self.role == "Admin" ? Event.where(status: "Draft") : self.events.where(status: "Draft")
	end

	def has_draft_access(e_id)
		is_admin ? true : Attendee.where(event_id: e_id, member_id: id).first.is_lead
	end 

	def is_admin
		role == "Admin"
	end

	def is_event_lead(e_id)
		if Attendee.where(event_id: e_id, member_id: id).first.nil?
			false
		else
			Attendee.where(event_id: e_id, member_id: id).first.is_lead
		end
	end
end
