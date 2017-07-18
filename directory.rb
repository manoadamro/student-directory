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

# print students one by one
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end

# print total number of students
puts "Overall, we have #{students.count} great students"
