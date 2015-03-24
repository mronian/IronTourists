require 'rubygems'
require 'faker'

Faker::Config.locale = 'en-IND'

#country
i = 1
numCtry = 1;
while i <= numCtry do
  i_item = "INSERT INTO Country values ( #{i}, '" + Faker::Address.country + "');"
  puts (i_item)
  i += 1
end  

puts ()
puts ()

#state
i = 1
numState = 25;
while i <= numState do
  i_item = "INSERT INTO State values ( #{i}, '" + Faker::Address.state + "', 1);"
  puts (i_item)
  i += 1
end  

puts ()
puts ()

#city
i = 1
numCity = 75;
while i <= numCity do
  i_item = "INSERT INTO City values ( #{i}, '" + Faker::Address.city.tr('\'', '') + "', '" + Faker::Address.zip.rjust(6,'0') + "', #{1 + rand(numState)} );"
  puts (i_item)
  i += 1
end  

puts ()
puts ()

#spot
i = 1
numSpot = 125;
while i <= numSpot do
  i_item = "INSERT INTO Spot values ( #{i}, '" + Faker::Address.city.tr('\'', '') + "', '" + Faker::Address.street_address.tr('\'', '') + "', #{1 + rand(numCity)} );"
  puts (i_item)
  i += 1
end  

puts ()
puts ()
