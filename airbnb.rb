require 'colorize'
class Home
	attr_reader :name, :city, :capacity, :price

	def initialize(name,city,capacity,price)
		@name = name
		@capacity = capacity
		@city = city
		@price = price
	end

end

class TextBnB
	def initialize
		@homes = []
	end

	def add_home(home)
		@homes << home
	end

	def printHomes(array)
		array.each_with_index do |hm,index|
			puts "House ##{index+1}: #{hm.name} in #{hm.city}."
			puts "Price: $#{hm.price} a night."
			puts "Capacity: #{hm.capacity} people.\n\n"
		end

		sumPrice = array.reduce(0.0) { |sum,hm| sum + hm.price }
		puts "Average price of search results is: $#{(sumPrice / array.length).round(2)}".colorize(:green)
	end

	def orderByPrice
		if @homesByPrice == nil
			@homesByPrice = @homes.sort { |h1,h2| h1.price <=> h2.price }	
		else
			@homesByPrice.reverse!
		end	
		puts "===== Ordered by Price =====".colorize(:blue)
		printHomes(@homesByPrice)
	end

	def orderByCapacity
		if @homesByCapacity == nil
			@homesByCapacity = @homes.sort! { |h1,h2| h2.capacity <=> h1.capacity }	
		else 
			@homesByCapacity.reverse!
		end

		puts "===== Ordered by Capacity =====".colorize(:blue)
		printHomes(@homesByCapacity)
	end 

	def filterByCity(city)
		puts "===== Filtered by #{city.capitalize} =====".colorize(:blue)
		homesByCity = @homes.select { |hm| hm.city.downcase == city.downcase }
		printHomes(homesByCity)
	end

	def getThisPrice(price)
		if getValidPrices.grep(price).length > 0
			puts "===== Filtered by $#{price} =====".colorize(:blue)
			homesByThisPrice = @homes.select { |hm| hm.price == price }
			printHomes(homesByThisPrice)
		else
			printErr
		end
	end

	def printInstructions
		price = "price".colorize(:magenta)
		capacity = "capacity".colorize(:magenta)
		exit = "exit".colorize(:magenta)
		puts "Enter #{price} to order by price."
		puts "Enter #{capacity} to order by capacity."
		puts "Enter #{exit} to exit the program."
		puts "Enter a city name to filter by that city."
		puts "Enter a number to find homes with that price."

	end

	def getValidCities
		@homes.map {|hm| hm.city.downcase }
	end

	def getValidPrices
		@homes.map { |hm| hm.price }
	end

	def printErr
		puts "Your request is not valid.".colorize(:red)
	end

	def city_or_err(action)
		
		if getValidCities.grep(action.downcase).length > 0
			filterByCity(action)
		else
			printErr
		end
	end

	def main
		action = "price"
		while action != 'exit' do
			printInstructions
			case action
				when "price"
					orderByPrice
				when "capacity"
					orderByCapacity
				when /\d/
					getThisPrice(action.to_i)
				when "exit"
					break
				else
					city_or_err(action)
				end
			action = gets.chomp
		end
	end
end

myBnB = TextBnB.new
myBnB.add_home(Home.new("Love Hotel Schwang", "Algete", 2, 55))
myBnB.add_home(Home.new("Rincón Romantico", "Madrid", 2, 105))
myBnB.add_home(Home.new("Casa Familiar", "Soto de Real", 8, 65))
myBnB.add_home(Home.new("Finde Loco con Amigos", "Guadalajara", 12, 150))
myBnB.add_home(Home.new("Casa Cutre", "Alcalá", 4, 35))
myBnB.add_home(Home.new("Hostel Juay", "Madrid", 6, 55))
myBnB.add_home(Home.new("Hostel Asqueroso", "Sevilla", 3, 45))
myBnB.add_home(Home.new("Lugar de Lujo", "Toledo", 2, 220))
myBnB.add_home(Home.new("En Tu Casa", "Burgos", 7, 70))

myBnB.main
