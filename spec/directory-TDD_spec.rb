require 'directory-TDD'

describe 'student directory' do

#removes surplus lines
		it 'removes surplus' do
		before(:each) do
			allow(self).to receive(:puts)
		end

	context 'prints out required text' do 
		it 'prints header' do
			header = "The students of my cohort at Makers Academy\n============"
			expect(self).to receive(:puts).with(header)
			print_header
		end
		
		it 'prints out a line' do
			expect(self).to receive(:puts).with("Hey there!") 
			print_str("Hey there!")
		end

		it 'prints out a request for user input' do
			str = "Please enter the names of the students\nTo finish, just hit return twice"
			expect(self).to receive(:puts).with(str)
			print_req_for_user_input
		end

		it 'prints out the footer with 1 student when there is 1 student' do
			footer = "Overall we have 1 great student"
			update_student_array("Nicola")
			expect(self).to receive(:puts).with(footer)
			print_footer
		end	

		it 'prints out the footer with n students when there are n students' do
			update_student_array("Nicola")
			update_student_array("Jeremy")
			footer = "Overall we have 2 great students"
			expect(self).to receive(:puts).with(footer)
			print_footer
		end

		it 'prints out 1 student in the array after 1 student is inputted' do
			expect(self).to receive(:puts).with("Now we have 1 student")
			update_student_array("Nicola")
		end	
		
		it 'prints out n students in the array after n students are inputted' do
			expect(self).to receive(:puts).with("Now we have 1 student")
			expect(self).to receive(:puts).with("Now we have 2 students")
			update_student_array("Nicola")
			update_student_array("Jeremy")	
		end	

		it 'print out a students information' do
			student_name = "Jeremy"
			cohort = :may
			update_student_array(student_name, cohort)
			expect(self).to receive(:puts).with("Jeremy (may cohort)")
			print_student(student_name, cohort)	
		end	

		it 'prints out a list of all students information' do
			update_student_array("Nicola")
			update_student_array("Jeremy")
			expect(self).to receive(:puts).with("Jeremy (june cohort)")
			expect(self).to receive(:puts).with("Nicola (june cohort)")
			print_students	
		end	

		it 'prints the exit statement' do
			expect(self).to receive(:print_header)
			expect(self).to receive(:print_students)
			expect(self).to receive(:print_footer)
			print_on_exit
		end
	end

	context 'Taking user input' do
		it 'takes a user input of students' do
			student_name ="Jeremy\n"
			expect(self).to receive(:gets).and_return(student_name)
			expect(take_user_input).to eq "Jeremy"
		end
		
		it 'ends student input if user hit return twice' do
			student_name = ""
			expect(self).to receive(:gets).and_return(student_name)
			expect(self).to receive(:puts).with("Overall we have 0 great student")
			input_students
		end

		it 'continues to ask for user input if names are entered' do
			student_name = "Jeremy"
			expect(self).to receive(:gets).and_return(student_name, "")
			expect(self).to receive(:puts).with("Please enter the names of the students\nTo finish, just hit return twice")
			input_students

		end
	end

	context 'saves information to the student list' do
		it 'saves a students name into a name hash in the student array and makes the cohort June' do
			student_name = "Nico"
			cohort = :may
			expect(save_student_name_to_hash(student_name, cohort)).to eq ({name: student_name, cohort: cohort})
		end
		
		it 'saves the student hash into the student array' do
			student_name = "Jeremy"
			cohort = :may
			update_student_array(student_name, cohort)
			expect(students.include?({:name => student_name, cohort: cohort})).to be true
		end

		it ' when a name is inputted, saves it to the student array' do
			expect(self).to receive(:take_user_input).and_return("Jeremy", "")
			input_students
			expect(students.include?({:name => "Jeremy", cohort: :june})).to be true
		end

		# it 'does not accept a name input once return has been hit twice' do
		# 	expect(self).to receive(:take_user_input).and_return("Jeremy", "")
		# 	expect(self).to not_receive(:take_user_input).and_return("Orange")
		# 	input_students
		# 	expect(students.include?({:name => "Orange", cohort: :june})).to be false
		# end
	end

	context 'counts the number of students in the array' do
		it 'count array' do
			update_student_array("Nicola")
			expect(count_students).to eq(1)
		end

		it 'can return the number of students when one is added' do
			update_student_array("Nicola")
			update_student_array("Jeremy")
			expect(count_students).to eq(2)
		end

	end

end