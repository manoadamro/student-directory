#!/usr/local/bin/ruby -w

# a hash of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

# prints the student list header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# prints the list body
def print_list(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

# prints the studentl list footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print_list(students)
print_footer(students)
