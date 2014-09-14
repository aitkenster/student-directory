student-directory
=================

This was our first project during weeks 1 and 2 of Makers Academy. Pairing with a mix of other students on the course, I created an interactive directory which could hold information about all of the students on the course. 

It has the following features:

+ List of all students
+ Ordered by name
+ Grouped by cohort (as an exercise)
+ Adds new students by asking the user to input the names
+ Show information about a given student
+ Add information related to a particular student (e.g. hobbies)
+ Has an interactive menu to ask the user what he or she would like to do
+ Displays information about the number of records in the directory
+ Saves data to a file
+ Loads data from a the file

### Technologies Used 

+ Ruby
+ RSPEC

### How to set it up
```sh
git clone git@github.com:aitkenster/student-directory.git
```

### How to run it
```sh
cd student-directory
ruby ./lib/directory-TDD.rb
```

open your browser and go to [localhost:3000](http://localhost:3000)

### How to test it
```sh
cd student-directory
rspec
``` 


### Future Improvements

+ Implement a student class
+ Split the directoy-TDD.rb file into smaller componenets, so it would be more readable.
