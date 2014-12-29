# http://tutorials.jumpstartlab.com/projects/eventmanager.html
# http://stackoverflow.com/questions/6337897/what-is-the-colon-operator-in-ruby

=begin
require "csv"
puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true
contents.each do |row|
  name = row[2]
  puts name
end
=end


require "csv"
puts "EventManager initialized."

=begin
Symbols are a way to represent strings and names in ruby.

You can think of symbols as string literals that are magically made into constants. 
Alternatively, you can consider the colon to mean "the thing named", so :id is "the thing named id".
=end

=begin
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  puts name
end
=end

require "csv"
puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  puts "#{name} #{zipcode}"
end






