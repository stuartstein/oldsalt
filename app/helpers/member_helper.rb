module MemberHelper
	
	def print_first_last(members_arr)
		members_arr.map! {|m| "#{m.first_name} #{m.last_name}"}
		members_arr.join(", ")
	end

end
