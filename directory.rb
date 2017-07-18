#!/usr/local/bin/ruby -w

# an array of students
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]

# prints the student list header
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list(names)
  names.each do |name|
    puts name
  end
end

# prints the studentl list footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print_list(students)
print_footer(students)
