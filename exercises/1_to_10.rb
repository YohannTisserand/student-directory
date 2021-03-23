def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
 
  while true do
    puts "-- Name please: --"
    name = gets.chomp
    break if name.empty?

    puts "-- Cohort please: --"
    cohort = gets.chomp
    cohort = "" if cohort.empty?

    puts "-- Hobbie please: --"
    hobbie = gets.chomp
    hobbie = "be evil" if hobbie.empty?

    puts "-- Height please: --"
    height =  gets.chomp
    height = "" if height.empty?

    students << {name: name, cohort: cohort, hobbie: hobbie, height: height}
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
    puts "#{i}- #{students[x][:name]} (#{students[x][:cohort]} cohort) | Hobbie: #{students[x][:hobbie]} | Height: #{students[x][:height]}"
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