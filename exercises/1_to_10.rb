def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
 
  while true do
    puts "-- Name please: --"
    name = gets.delete("\n")
    break if name.empty?

    puts "-- Cohort please: --"
    cohort = gets.delete("\n")
    cohort = "" if cohort.empty?

    puts "-- Hobbie please: --"
    hobbie = gets.delete("\n")
    hobbie = "be evil" if hobbie.empty?

    puts "-- Height please: --"
    height =  gets.delete("\n")
    height = "" if height.empty?

    students << {name: name, cohort: cohort, hobbie: hobbie, height: height}
    puts "Now we have #{students.count} students"
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------".center(32)
end

def print(students)
=begin
  students.each.with_index(1) do |student, idx|
    puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)" #if student[:name].length < 12
  end
=end
  x = 0
  puts "-- Enter a cohort, please: --"
  month = gets.delete("\n")
  while x < students.length do
    if month == students[x][:cohort]
      i = x + 1
      puts "#{i}- #{students[x][:name]} (#{students[x][:cohort]} cohort) | Hobbie: #{students[x][:hobbie]} | Height: #{students[x][:height]}"
    end
    x += 1
  end
end

def print_footer(students)
  puts students.length > 1 ? "Overall, we have #{students.count} great students" : "Overall, we have #{students.count} great student"
  puts "Empty list" if students.length == 0
end

students = input_students
print_header
print(students)
print_footer(students)