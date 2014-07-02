require 'CSV'

#printing method
def print_header
	 puts("The students of my cohort at Makers Academy\n============")
end

def print_footer
	puts "Overall " + print_student_total 
end

#counts the students
def count_students
	students.length
end

def plural_students
	count_students > 1 ? "s" : ""
end

def print_student_total
	"we have #{count_students} great student#{plural_students}"
end

# print student directory details

def print_update_status
	puts "Now " + print_student_total
end

def print_student(name, cohort, nationality)
	puts("#{name} (#{cohort} cohort) from #{nationality}")
end

def print_req_for_student_name
	puts("Please enter the names of the students\nTo finish, just hit return twice")
end

def print_students
	students.each do |student| 
		print_student(student[:name], student[:cohort], student[:nationality])
	end
end

def print_on_exit
	print_header
	print_students
	print_footer
end



#user input methods

def take_user_input
	gets.chomp
end

def ask_for_detail
	"Please enter the student's "
end

def ask_for_cohort
	puts ask_for_detail + "cohort"
end

def ask_for_nationality
	puts ask_for_detail + "nationality"
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
		ask_for_nationality
			nationality = take_user_input
		print_req_for_student_name
		update_student_array(name, cohort, nationality)
		print_req_for_student_name
			name = take_user_input
	end	
	print_on_exit
end

# save input into the stuent array


def update_student_array(name, cohort = "june", nationality)
	students << save_student_name_to_hash(name, cohort, nationality)
#	print_update_status
	print_students
end

def set_default_cohort_value(cohort)
	return "june" if cohort.empty?
	cohort
end

def save_student_name_to_hash(name, cohort, nationality)
	cohort_value = set_default_cohort_value(cohort)
	{:name => name, :cohort => cohort_value, :nationality => nationality}
end

def process(selection)
	
	case selection
	when '1'
		input_students
	when '2'
		print_on_exit
	when '3'
		save_to_file
	when '4'
		read_the_file
	when '9'
		exit
	end
end

def interactive_menu
	loop do
		print_menu
		process(selection = take_user_input)
	end
end

def print_menu
	puts "1. Add a student"
	puts "2. Show all the students"
	puts "3. Save the students"
	puts "4. Load the student from a file"
	puts "9. EXIT"
end

def save_to_csv_format(student)
	student.values
end

def save_to_file(students, filename = "student.csv")
	CSV.open(filename, 'wb') do |csv|
		students.each do |student|
			csv << save_to_csv_format(student)
		end
	end
end

def read_the_file(filename = "student.csv")
	CSV.foreach(filename) do |row|
		update_student_array(row[0], row[1], row[2])
	end
end
=begin


interactive_menu
print_on_exit

irset_default_cohort_value("")
=end