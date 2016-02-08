require 'pry'
class Car
	attr_reader :make, :model
	def initialize(make, model, year)
		@make = make
		@model = model
		@year = year
	end

end

class CarDealer
	
	def initialize
		@cars = []
	end

	def add_car(car)
		@cars << car
	end

	def cars(make)
		
		print_cars(@cars.select {|car| car.make == make})
	end

	def print_cars(array)
		make = array.reduce("") {|name,car| car.make}
		models =  array.map {|car| car.model}
		
		allModels = ""
		models.uniq.each {|m| allModels += (m + ", ")}

		allModels.chop!.chop!
		
		puts "#{make}: #{allModels}"
	end

	def inventory

		@cars.map {|car| car.make}.uniq.each {|m| cars(m)}
	end

end

myDealership = CarDealer.new

myDealership.add_car(Car.new("Ford","Fiesta",1976))
myDealership.add_car(Car.new("Ford","Mustang",1965))
myDealership.add_car(Car.new("Ford","Mustang",1967))
myDealership.add_car(Car.new("Seat","Ibiza",2002))
myDealership.add_car(Car.new("Seat","León",2005))
myDealership.add_car(Car.new("Seat","León",2004))
myDealership.add_car(Car.new("Seat","Córdoba",2004))
myDealership.add_car(Car.new("Seat","Ibiza",2004))

# myDealership.cars("Ford")

# myDealership.cars("Seat")

myDealership.inventory


