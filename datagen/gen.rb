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

#fares

numFares = 4
i_item = "INSERT INTO Fare values ( 1, 'Children - below 18');"
puts(i_item)
i_item = "INSERT INTO Fare values ( 2, 'Adults - below 18');"
puts(i_item)
i_item = "INSERT INTO Fare values ( 3, 'Camera');"
puts(i_item)
i_item = "INSERT INTO Fare values ( 4, 'NRI');"
puts(i_item)

puts ()
puts ()

#spotfare
i = 1
while i <= numSpot do
  j = 1
  while j <= numFares do
    i_item = "INSERT INTO SpotFare values (#{i}, #{j}, #{j*(1 + rand(100))});"
    j += 1
  end
  i += 1
end

puts ()
puts ()

#type
numTypes = 7
i_item = "INSERT INTO Type values ( 1, 'Hill Stations');"
puts(i_item)
i_item = "INSERT INTO Type values ( 2, 'Zoo');"
puts(i_item)
i_item = "INSERT INTO Type values ( 3, 'Natural Parks');"
puts(i_item)
i_item = "INSERT INTO Type values ( 4, 'Museum');"
puts(i_item)
i_item = "INSERT INTO Type values ( 5, 'Temples');"
puts(i_item)
i_item = "INSERT INTO Type values ( 6, 'Beach');"
puts(i_item)
i_item = "INSERT INTO Type values ( 7, 'Hill Stations');"
puts(i_item)

puts ()
puts ()

#spotType
i = 1
while i <= numSpot do
  i_item = "INSERT INTO SpotType values (#{i}, #{1 + rand(numTypes)});"
  puts(i_item)
  i += 1
end

puts ()
puts ()

#hub
i = 1
j = 1
while i <= numCity do
  i_item = "INSERT INTO Hub values ( #{j}, '" + Faker::Address.city.tr('\'', '') + "', '" + Faker::Address.street_address.tr('\'', '') + "', #{i} );"
  puts (i_item)
  j += 1
  i_item = "INSERT INTO Hub values ( #{j}, '" + Faker::Address.city.tr('\'', '') + "', '" + Faker::Address.street_address.tr('\'', '') + "', #{i} );"
  puts (i_item)
  j += 1
  i += 1
end  

puts ()
puts ()

#conveyance
numCons = 4
i_item = "INSERT INTO Conveyance values ( 1, 'Bus');"
puts(i_item)
i_item = "INSERT INTO Conveyance values ( 2, 'Auto Rickshaw');"
puts(i_item)
i_item = "INSERT INTO Conveyance values ( 3, 'Walking');"
puts(i_item)
i_item = "INSERT INTO Conveyance values ( 4, 'Cycle Rickshaw');"
puts(i_item)

puts ()
puts ()

#hubspot info


#hotel chains
i_item = "INSERT INTO HotelChain values ( 0, 'None');"
puts (i_item)
i = 1
numHC = 10
while i <= numHC do
  i_item = "INSERT INTO HotelChain values ( #{i}, '" + Faker::Company.name.tr('\'', '') + "');"
  puts (i_item)
  i += 1
end  

puts ()
puts ()

#hotels
i = 1
numH = 125;
while i <= numH do
  p = rand(10)
  if p < 5
    i_item = "INSERT INTO Hotel values ( #{i}, '" + 'Hotel ' + Faker::Name.last_name.tr('\'', '') + "', '" + Faker::Address.street_address.tr('\'', '') + "', #{1 + rand(numCity)}, #{1+rand(numHC)});"
  else
    i_item = "INSERT INTO Hotel values ( #{i}, '" + 'Hotel ' + Faker::Name.last_name.tr('\'', '') + "', '" + Faker::Address.street_address.tr('\'', '') + "', #{1 + rand(numCity)}, 0);"
  end  
  puts (i_item)
  i += 1
end  

puts ()
puts ()

#restaurant chains
i_item = "INSERT INTO RestaurantChain values ( 0, 'None');"
puts (i_item)
i = 1
numRC = 10
while i <= numRC do
  i_item = "INSERT INTO RestaurantChain values ( #{i}, '" + Faker::Company.name.tr('\'', '') + "');"
  puts (i_item)
  i += 1
end  

puts ()
puts ()

# Restaurants
i = 1
numR = 125;
while i <= numR do
  p = rand(10)
  if p < 5
    i_item = "INSERT INTO Restaurant values ( #{i}, '" + Faker::Name.last_name.tr('\'', '') + "', '" + Faker::Address.street_address.tr('\'', '') + "', #{1 + rand(numCity)}, #{1+rand(numRC)});"
  else
    i_item = "INSERT INTO Restaurant values ( #{i}, '" + Faker::Name.last_name.tr('\'', '') + "', '" + Faker::Address.street_address.tr('\'', '') + "', #{1 + rand(numCity)}, 0);"
  end  
  puts (i_item)
  i += 1
end  

puts ()
puts ()


