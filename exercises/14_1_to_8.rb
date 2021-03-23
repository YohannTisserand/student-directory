@students = []
@default_file = "students.csv"

def save_students
  puts "Name of the file, please: (press enter for a default name)"
  name_file = STDIN.gets.chomp
  name_file.empty? ? name_file = @default_file : name_file += ".csv"
  file = File.open(name_file, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
  puts "=== Saved ==="
end

def load_students
  puts "Name of the file to load please: "
  file_to_load = STDIN.gets.chomp
  file_to_load.empty? ? file_to_load = @default_file : file_to_load += ".csv"
  file = File.open(file_to_load, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_students(name, cohort)
  end
  file.close
  puts "=== File loaded! ==="
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  while true do
    puts "Now we have #{@students.count} students"
    puts "=== Name: ==="
    name = STDIN.gets.chomp
    break if name.empty?
    puts "=== cohort: ==="
    cohort = STDIN.gets.chomp
    puts "=== Student Added! ==="
    add_students(name, cohort)
  end
end

def load_student_file_on_start
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "=== Loaded #{@students.count} from #{filename} ==="
  else
    puts "=== Sorry, #{filename} doesn't exist. ==="
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "=== 1. Input the students ==="
  puts "=== 2. Show the students ==="
  puts "=== 3. Save the list to students.csv ==="
  puts "=== 4. Load the list from students.csv ==="
  puts "=== 9. Exit ===" 
end

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
    exit
  else
    "=== Invalid command. Try again. ==="
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "=== The students of Villains Academy ==="
  puts "-------------"
end

def print_students_list
  @students.each.with_index(1) { |student, idx| puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "=== Overall, we have #{@students.count} great students ==="
end

load_student_file_on_start
interactive_menu