
# formattedCities = cities.map { |city| city.capitalize }

# puts cities
# puts "---"
# puts formattedCities
cities = ["madrid","sandiego","melbourne","sevilla","london","sydney","woopwoop","waggawagga"]

puts cities.reduce { |long,city| long.length < city.length ? city : long }
