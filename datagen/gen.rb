require 'rubygems'
require 'faker'

i = 1
num = 1;
while i <= num do
  i_country = "INSERT INTO TABLE Country values ( #{i}, '" + Faker::Address.country + "');"
  puts (i_country)
  i += 1
end  

puts ()
puts ()

i = 1
num = 25;
while i <= num do
  i_country = "INSERT INTO TABLE State values ( #{i}, '" + Faker::Address.state + "', 1);"
  puts (i_country)
  i += 1
end  

puts ()
puts ()


