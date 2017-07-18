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

require 'date'


# used for date validation
class String

  # returns true if a string contains only numeric characters
  def is_number?
    true if Float(self) rescue false

  end

end


@width = 16

@students = []


# gets the cohort month (string)
def get_cohort(name)

  this_month = Date::MONTHNAMES[Date.today.month]
  puts "Which cohort will #{name} be a part of? -> hit return to use current month (#{this_month})"

  while true do

    # get the user to enter a date of birth
    cohort = gets.chomp.capitalize

    return this_month if cohort.empty?

    # check it is valid and return
    if Date::MONTHNAMES.include? cohort then
      return cohort
    else
      puts "#{cohort} is not a valid month\ntry agin..."
    end

  end

end


# gets date of birth from user entry
def get_dob(name)

  puts "Enter a date of birth for #{name}: (ddmmyy) -> hit return to skip"

  while true do

    # get the user to enter a date of birth
    dob = gets.chomp.tr('/', '')

    return if dob.empty?

    # check it is valid and return
    if dob.length == 6 && dob =~ /[0-3][0-9][0-1][0-9]{3}/ then
      return "#{dob[0..1]}/#{dob[2..3]}/#{dob[4..5]}"

    # if not valid, try agiain
    else
      puts "#{dob} is not a valid date 'ddmmyy'\ntry again..."
    end
  end

end


# gets height from user entry
def get_height(name)

  puts "Enter height in cm for #{name}: -> hit return to skip"

  while true do

    # get the user to enter a height
    height = gets.chomp

    return if height.empty?

    # check it is valid and return
    if height.is_number? then return height

    # if not valid, try agiain
    else
      puts "#{height} is not a valid height in cm, should be numeric\ntry again..."
    end
  end

end


# gets a country of brith from user entry
def get_cob(name)

  puts "Enter country of birth for #{name}: -> hit return to skip"

  # return whatever the user enters, no validation
  return gets.chomp

end


# returns a formatted list of hobbies from user entry
def get_hobbies(name)

  puts "Enter hobbies for #{name}:  (separate with comma & space ', ') -> hit return to skip"

  # return whatever the user enters, no validation
  return gets.chomp.split(', ')
end


# manual input for student list
def input_students

  puts "\nPlease enter the names of the students"
  puts "To finish, hit return twice\n"

  # get the first name, with no line break
  name = gets.tr("\n", "")

  # while the name is not empty
  while !name.empty? do

    # get cohort for the new student
    cohort = get_cohort(name)

    # get a date of birth for the new student
    dob = get_dob(name)

    # get height for the new student
    height = get_height(name)

    # get country of birth for the new student
    cob = get_cob(name)

    # get list of hobbies for the new student
    hobbies = get_hobbies(name)

    # print out the data we just collected
    puts("\nadding new student:\nname: #{name}\nd.o.b #{dob}\nheight: #{height}\nc.o.b #{cob}\nhobbies: #{hobbies.join(", ")}\n")

    # add student hash to array
    @students << {
      name: name,
      cohort: cohort,
      dob: dob,
      height: height,
      cob: cob,
      hobbies: hobbies
    }

    student_plural = (@students.count == 1) ? "student" : "students"
    puts "Now we have #{@students.count} #{student_plural}\n"

    # get the next name from user
    name = gets.tr("\n", "")
  end

end


# prints the student list header
def print_header

  puts "The students of Villains Academy"
  puts "%s %s %s %s %s %s %s" % [
    "ID".ljust(2),
    "Name".ljust(@width),
    "Cohort".ljust(@width),
    "D.O.B".ljust(@width),
    "Height(cm)".ljust(@width),
    "C.O.B".ljust(@width),
    "Hobbies"
  ]
  puts "-------------"
end


# pretty prints student data from hash
def print_name(student, index=-1)

  name = ("%s" % student[:name]).ljust(@width)
  cohort = ("%s" % student[:cohort]).ljust(@width)
  dob = ("%s" % student[:dob]).ljust(@width)
  height = ("%scm" % student[:height]).ljust(@width)
  cob = ("%s" % student[:cob]).ljust(@width)
  hobbies = "%s" % student[:hobbies].join(', ')

    # supports printing with or without index
    puts index >= 0 ?

      # if an index was supplied, print with index
      "#{(index + 1).to_s.ljust(2)} #{name} #{cohort} #{dob} #{height} #{cob} #{hobbies}" :

      # otherwise print without index
      "   #{name} #{cohort} #{dob} #{height} #{cob} #{hobbies}"
end


# prints the list body
def print_list

  # using 'each_with_index'
  #names.each_with_index do |name, index|
  #  print_name(name, index)
  #end

  # using 'while'
  i = 0
  while i < @students.length do
    print_name(@students[i], i)
    i += 1
  end
end


# prints the list grouped by cohort
def print_by_cohort

  # for each month in the year (in order)
  Date::MONTHNAMES.each do |month|

    # find students in this months cohort
    list = @students.select {|name| name[:cohort] == month}

    # if the cohort is empty and skip_empty is true, skip
    if list.length == 0 then next

    # otherwise print cohort list
    else
      # print list
      print_header
      print_list(list)
      print_footer(list)
    end

  end

end


# prints a list of students in a specific cohort
def print_cohort(month)

  puts "All students on %s cohort" % month
  print_list(@students.select {|name| name[:cohort] == month})

end


# prints list of names starting with specific letter
def print_names_starting_with(letter)

  # check that a letter was supplied
  if letter.empty? then
    puts "Could not print names starting with letter: no letter supplied"
    return

  elsif !( letter =~ /[[:alpha:]]/)
    puts "Could not print names starting with letter: must be a letter. (given '#{letter}')"
    return

  # make sure it was a letter
  elsif letter.length != 1
    puts "Could not print names starting with letter: must be a single letter. (given '#{letter}')"
    return

  end

  puts "All names starting with %s" % letter
  @students.select {|anyname| anyname[:name][0].downcase == letter.downcase}.each_with_index do |name, index|
    print_name(name, index)
  end
end


# prints list of names shorter then n letters
def print_short_names(names, max_letters=12)

  puts "All names shorter than %i characters" % max_letters
  names.select {|anyname| anyname[:name].length < max_letters}.each_with_index do |name, index|
    print_name(name, index)
  end
end


# prints the student list footer
def print_footer
  puts "Overall, we have #{@students.count} great students\n"
end


# saves students to csv file
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


# loads students from csv file
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end


# displays help menu
def print_help
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end


# displays students
def show_students

  if @students.empty? then
    puts "Student list is empty\n"
    return
  end

  print_header
  print_list
  print_footer
end


# main menu loop
def interactive_menu

  def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end

  while true do
    print_help
    process(gets.chomp)
  end
end


# start the program [brum-brum]
interactive_menu()
