#!/usr/local/bin/ruby -w

# a hash of students
#students =
#  {name: "Dr. Hannibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Krueger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
#]

# manual input for student list
def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"

  # create an empty array to store names
  students = []

  # get the first name, with no line break
  name = gets.chomp

  # while the name is not empty
  while !name.empty? do

    # add student hash to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    # get the next name from user
    name = gets.chomp
  end

  # return the array of students
  students
end

# prints the student list header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_name(name, index=-1)
  if index >= 0 then
    puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)"
  else
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

# prints the list body
def print_list(names)
  names.each_with_index do |name, index|
    print_name(name, index)
  end
end

# prints list of names starting with specific letter
def print_names_starting_with(names, letter)
  names.select {|anyname| anyname[:name].downcase[0] == letter.downcase}.each_with_index do |name, index|
    print_name(name, index)
  end
end

# prints list of names shorter then n letters
def print_short_names(names, max_letters=12)
  names.select {|anyname| anyname[:name].length < max_letters}.each_with_index do |name, index|
    print_name(name, index)
  end
end

# prints the studentl list footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
#print_list(students)
#print_names_starting_with(students, "M")
#print_short_names(students, 12)
print_footer(students)
