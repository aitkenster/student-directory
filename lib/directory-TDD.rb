def print_header
	 print_str("The students of my cohort at Makers Academy\n============")
end

def print_footer
	print_str("Overall we have #{count_students} great student#{plural_students}")
end

def print_str(string)
	puts string
end

def print_req_for_user_input
	print_str("Please enter the names of the students\nTo finish, just hit return twice")
end

def print_update_status
	print_str("Now we have #{count_students} student#{plural_students}")
end

def print_students
	students.each do |student| 
		print_student(student[:name], student[:cohort])
	end
end

def print_student(name, cohort)
	print_str("#{name} (#{cohort} cohort)")
end

def print_on_exit
	print_header
	print_students
	print_footer
end

def plural_students
	count_students > 1 ? "s" : ""
end

def take_user_input
	gets.chomp
end

def save_student_name_to_hash(name, cohort=:june)
	{:name => name, cohort: cohort}
end

def update_student_array(name, cohort=:june)
	students << save_student_name_to_hash(name, cohort)
	print_update_status
end

def count_students
	students.length
end

def students 
	@students ||= []
end

def input_students
	print_req_for_user_input
	name = take_user_input
	
	while !name.empty? do
		print_req_for_user_input
		update_student_array(name)

		name = take_user_input
	end
		
	print_on_exit

end




