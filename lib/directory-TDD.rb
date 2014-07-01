#printing method
def print_header
	 print_str("The students of my cohort at Makers Academy\n============")
end

def print_footer
	print_str("Overall we have #{count_students} great student#{plural_students}")
end

def print_str(string)
	puts string
end

def print_req_for_student_name
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

#user input methods

def take_user_input
	gets.chomp
end

def ask_for_cohort
	puts "Please enter the student's cohort"
end

def assign_cohort
	@cohort = gets
end

def save_student_name_to_hash(name, cohort)
	cohort_value = set_default_cohort_value(cohort)
	{:name => name, :cohort => cohort_value}
end

def save_student_cohort_to_hash(cohort)
	{:cohort => cohort}
end

def set_default_cohort_value(cohort)
	return "june" if cohort.empty?
	cohort
end

def update_student_array(name, cohort = "june")
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
	print_req_for_student_name
	name = take_user_input
	
	while !name.empty? do
		ask_for_cohort
		cohort = take_user_input
		print_req_for_student_name

		update_student_array(name, cohort)
		print_req_for_student_name
		name = take_user_input

	end	

	print_on_exit

end

#input_students
#irset_default_cohort_value("")
