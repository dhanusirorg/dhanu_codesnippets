require 'csv'

# Reading at once
# data = CSV.read('responses.csv', headers: true)

COL_TYPE = {
  name: 1, email: 2, education: 3, student: 4, location: 5, comment: 6
}

total_attendees = 0
total_students = 0
total_graduates = 0
# total_comments = 0
# attendees_from_nepal = 0

# headers when true treat the first row as header and
CSV.foreach('responses.csv', headers: true) do |row|
  # puts row[COL_TYPE[:name]]
  # puts row[COL_TYPE[:education]]
  # puts row[COL_TYPE[:student]]

  if row[COL_TYPE[:student]] == 'Student'
    total_students += 1
  end

  if row[COL_TYPE[:education]] == 'Graduation'
    total_graduates += 1
  end

  total_attendees += 1
end

puts "Total Attendees: #{total_attendees}"
puts "Total Students : #{total_students}"
puts "Total Attendees: #{total_graduates}"
