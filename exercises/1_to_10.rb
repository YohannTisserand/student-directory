def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  #puts "-- name please: -- "
  #name = gets.chomp
  while true do
    puts "-- name please: --"
    name = gets.chomp
    break if name.empty?
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
=begin
  students.each.with_index(1) do |student, idx|
    puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)" #if student[:name].length < 12
  end
=end
  x = 0
  while x < students.length do
    i = x + 1
    puts "#{i}- #{students[x][:name]} (#{students[x][:cohort]} cohort"
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)