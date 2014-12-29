# http://tutorials.jumpstartlab.com/projects/eventmanager.html

puts "EventManager Initialized!"

=begin
contents = File.read "event_attendees.csv"
puts contents
=end

=begin
lines = File.readlines "event_attendees.csv"
lines.each do |line|
  puts line
end
=end

=begin

lines = File.readlines "event_attendees.csv"
lines.each do |line|
  next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"

  columns = line.split(",")
  # puts columns
  name = columns[2]
  puts name
end
=end

=begin
lines = File.readlines "event_attendees.csv"
row_index = 0
lines.each do |line|
  row_index = row_index + 1
  next if row_index == 1
  columns = line.split(",")
  name = columns[2]
  puts name
end
=end



lines = File.readlines "event_attendees.csv"
lines.each_with_index do |line,index|
  next if index == 0
  columns = line.split(",")
  name = columns[2]
  puts name
end







