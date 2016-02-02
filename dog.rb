require 'pry'
class Dog
	attr_reader :breed, :bark, :smells
	attr_accessor :name

	def initialize(name,breed='mutt',bark)
		@name = name
		@breed = breed
		@bark = bark
		@logfile = @name + "_smelled.txt"
		file = File.open(@logfile,"w")
		file.close
	end

	def smell(name)
		file = File.open(@logfile,"a")
		file.puts(name)
		file.close
	end

	def peopleSmelled
		f = File.open(@logfile,"r")
		people = f.read.split(/\n/)
		#binding.pry
		f.close
		people
	end

end

class Hound < Dog
	def track
		puts "Sniff sniffff sniffffff"
	end
end

class PetDog < Dog
	def initialize(name,breed,bark,owner)
		super name,breed,bark
		@owner = owner
	end

	def fetch(toy)
		puts "#{@name} is playing fetch with #{@owner} and the #{toy}."
	end

	def hiccupBark
		puts "#{self.bark} HIC! #{self.bark}"
	end

end

rover = Dog.new('Rover','Goldie','Woof!')
chiwawa = Dog.new('Wawi','Chiwawa','Yipipip!')
basset = Hound.new('Scooby','hound','Auuuuu!')

# rover.bark
# chiwawa.bark

# basset.bark
# basset.track

# myPet = PetDog.new('Sally','mutt','Arf!','Rachel')
# myPet.bark
# myPet.fetch('stick')
# myPet.hiccupBark

# puts rover.name
# rover.name= 'Rover2'
# puts rover.name


basset.smell('Rachel')
basset.smell('Nico')
basset.smell('David')
basset.smell('Adrian')

basset.smell('Paco')
puts "Basset smelled:"
puts basset.peopleSmelled

chiwawa.smell('Berni')
chiwawa.smell('Claire')
chiwawa.smell('Lizzie')
puts "Chiwawa smelled:"
puts chiwawa.peopleSmelled

