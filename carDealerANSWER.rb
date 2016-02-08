require 'pry'


class CarDealer
	
	def initialize(inventory)
		@inventory = inventory
	end


	def cars(brand)
		
		@inventory.select {|car| car[:brand].downcase == brand.downcase}
	end

	def pretty_print_inventory
		pretty_print_inventory = {}

		@inventory.each do |car|
			brand = car[:brand].downcase.capitalize
			pretty_print_inventory[brand] ||= []
			pretty_print_inventory[brand] << car[:model].downcase.capitalize
		end

		pretty_print_inventory.each do |brand,models|
			puts "#{brand}: #{models.join(", ")}"
		end 
	end

end



inventory = [
	{brand: "Ford", model: "Fiesta", year: 2010, license: "ASD123"},
	{brand: "Ford", model: "Mustang", year: 1965, license: "QWE456"},
	{brand: "Seat", model: "León", year: 2002, license: "ZXC567"},
	{brand: "Mini", model: "cooper", year: 2002, license: "123456"},
	{brand: "Tesla", model: "S", year: 2002, license: "654321"},
	{brand: "Seat", model: "León", year: 2002, license: "YUI789"},
	{brand: "Seat", model: "Ibiza", year: 2007, license: "JKL890"}
]

myDealership = CarDealer.new(inventory)

puts myDealership.cars("Ford").inspect
puts myDealership.cars("Seat").inspect

myDealership.pretty_print_inventory



