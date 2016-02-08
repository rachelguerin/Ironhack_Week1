class Vehicle
	attr_reader :wheels, :noise

	def initialize(wheels,noise)
		@wheels = wheels
		@noise = noise
	end
end


class Counter
	def countsWheels(array)
		total = 0
		array.each do |item|
			total += item.wheels 
		end

		total
	end
end

class Printer
	def printVehicles(array)
		array.each do |item|
			puts "This vehicle goes #{item.noise}"
		end
		
	end
end

truck = Vehicle.new(12,"DRRRRR")
bicycle = Vehicle.new(2,"whirr")
car = Vehicle.new(4,"brrmmm")
helicopter = Vehicle.new(0,"whpwhpwhp")

vehicleArray = [truck,bicycle,car,helicopter]

puts Counter.new.countsWheels(vehicleArray)

Printer.new.printVehicles(vehicleArray)