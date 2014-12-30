# http://tutorials.jumpstartlab.com/projects/eventmanager.html
# http://stackoverflow.com/questions/6337897/what-is-the-colon-operator-in-ruby

=begin
require "csv"
puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  puts "#{name} #{zipcode}"
end
=end

=begin

String#length - returns the length of the string.
String#rjust - to pad the string with zeros.
String#slice - to create sub-strings either through the slice method or the array-like notation []
=end

=begin

require 'csv'

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  if zipcode.length < 5
    zipcode = zipcode.rjust 5, "0"
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
  end

  puts "#{name} #{zipcode}"
end

C:/Users/bryantt23/Documents/GitHub/event_manager/lib/event_manager_12.rb:34:in `block in <main>': undefined method `length' for nil:NilClass (NoMethodError)
  from C:/RailsInstaller/Ruby2.0.0/lib/ruby/2.0.0/csv.rb:1719:in `each'
  from C:/Users/bryantt23/Documents/GitHub/event_manager/lib/event_manager_12.rb:30:in `<main>'
=end


require 'csv'

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  if zipcode.nil?
    zipcode = "00000"
  elsif zipcode.length < 5
    zipcode = zipcode.rjust 5, "0"
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
  end

  puts "#{name} #{zipcode}"
end

=begin

require 'csv'

def clean_zipcode(zipcode)
  if zipcode.nil?
    "00000"
  elsif zipcode.length < 5
    zipcode.rjust(5,"0")
  elsif zipcode.length > 5
    zipcode[0..4]
  else
    zipcode
  end
end
=end

=begin

Does the code clearly express what it is trying to accomplish?
The implementation does a decent job at expressing what it accomplishes. 
The biggest problem is that it is expressing it near so many other concepts. 
To make this implementation clearer we should move this logic into 
its own method named clean_zipcode.
=end

=begin

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end
=end

=begin

It would be much easier if instead of checking for a nil value we 
convert the nil into a string with NilClass#to_s.

Examining String#rjust in irb we can see that when we provide values greater 
than 5 it performs no work. This means we apply it in both cases 
as it will have the same intended effect.

Lastly, examining String#slice in irb we can see that a number that is exactly 
five digits in length it has no effect. This also means we can apply it in cases 
when the zip code is five digits or more than five digits and 
it will have the same effect.
=end


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end
