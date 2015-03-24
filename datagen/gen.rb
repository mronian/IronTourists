require 'rubygems'
require 'faker'

Faker::Config.locale = 'en-IND'

#country
i = 1
numCtry = 1;
while i <= numCtry do
  i_item = "INSERT INTO TABLE Country values ( #{i}, '" + Faker::Address.country + "');"
  puts (i_item)
  i += 1
end  

puts ()
puts ()

#state
i = 1
numState = 25;
while i <= numState do
  i_item = "INSERT INTO TABLE State values ( #{i}, '" + Faker::Address.state + "', 1);"
  puts (i_item)
  i += 1
end  

puts ()
puts ()

#city
i = 1
numCity = 100;
while i <= numCity do
  i_item = "INSERT INTO TABLE City values ( #{i}, '" + Faker::Address.city + "', '" + Faker::Address.zip + "', #{1 + rand(numState)} );"
  puts (i_item)
  i += 1
end  

puts ()
puts ()
