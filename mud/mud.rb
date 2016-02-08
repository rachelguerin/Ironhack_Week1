require 'pry'
require 'colorize'

module HasObjects
	# attr_reader :objects
	# @objects = []
	def set_object(object)
		@objects << object
	end
	def drop_object(object)
		@objects.delete_if {|o| o.downcase == object.downcase}
	end
	def print_objects
		@objects.each do |o|
			puts "There is a #{o}."
		end
	end

	def has_object(object)
		@objects.include? object
	end

end

class Room
	include HasObjects
	attr_reader :description, :valid_directions, :isExit, :isDeath, :objects
	def initialize(description,isExit=false,isDeath=false)
		@description = description
		@valid_directions = {}
		@isExit = isExit
		@isDeath = isDeath
		@objects = []
	end

	def set_valid_directions(hash)
		@valid_directions = hash
	end

	def print_description
		puts description
		if has_object("key") 
			puts "There is a key on the floor."
		end
	end
end

class Player
	include HasObjects
	def initialize(name)
		@name = name
		@objects = []
	end

end

class House
	def initialize(rooms,player,startRoom)
		@rooms = rooms
		@player = player
		@currentRoom = startRoom
	end

	def try_direction(direction,room)
		
		newRoom = room.valid_directions[direction.upcase.to_sym]
		
		if newRoom != nil		
			@currentRoom = newRoom
		else
			puts "You cannot go that way.".colorize(:red)
		end
		
	end

	def try_instruction(action,room)
		binding.pry
		if action.include? "key"
			if @currentRoom.has_object("key")
				@player.set_object("key")
				@currentRoom.drop_object("key")
				puts "You have the key!"
			else
				puts "There is no key in this room.".colorize(:red)
			end
		else

		end

	end

	def try_to_leave
		binding.pry
		if @player.has_object("key")
			"exit"
		else
			puts "You don't have the key."
			try_direction("W",@currentRoom)
		end
	end

	def main
		action = ""
		while action.downcase != "exit".downcase
			@currentRoom.print_description
			if @currentRoom.isDeath
				action = "exit"
			elsif @currentRoom.isExit
				action = try_to_leave
			else			
				action = gets.chomp
				
				case action
				when /[NSEW]/
					try_direction(action,@currentRoom)
				when /exit/
					action = "exit"
				else 
					try_instruction(action,@currentRoom)
				end
				
			end
		end

	end
end



r1 = Room.new("You are in the toilet. Light falls from the window behind you. There is a door to the north.")
r0 = Room.new("You climb out the toilet window to freedom.\nYOU WIN!!!",true)
r2 = Room.new("You are in a hallway.")
r3 = Room.new("You are in a hallway. There is a door to the north and more hall to the west.")
r4 = Room.new("You are in a hall cupboard. The zombie hiding there eats you. You die.\nGAME OVER",false,true)
r5 = Room.new("The hallway continues to the north.")
r6 = Room.new("The hallway continues to the east.")
r7 = Room.new("The hallway continues to the east.")
r8 = Room.new("The hallway continues to the east.")
r9 = Room.new("There is a door to the east and more hall to the north and south.")
r10 = Room.new("You are in the kitchen. It is on fire! You die.\nGAME OVER",false,true)
r11 = Room.new("There is a door to the east.")
r13 = Room.new("The hallway continues to the north.")
r14 = Room.new("There is a door to the east.")
r15 = Room.new("You have escaped the house and are free!\nYOU WIN!!",true)

r1.set_valid_directions({
	N: r2,
	S: r0
})

r2.set_valid_directions({
	N: r3,
	S: r1
})

r3.set_valid_directions({
	N: r4,
	S: r2,
	W: r5 
})

r4.set_valid_directions({})

r5.set_valid_directions({
	N: r6,
	E: r3
	})

r6.set_valid_directions({
	S: r5,
	E: r7
	})
r7.set_valid_directions({
	W: r6,
	E: r8
	})
r8.set_valid_directions({
	W: r7,
	E: r9
	})
r9.set_valid_directions({
	W: r8,
	E: r10,
	S: r11,
	N: r13
	})
r10.set_valid_directions({})
r11.set_valid_directions({
	E: r10,
	N: r9
	})
r13.set_valid_directions({
	S: r9,
	N: r14
	})
r14.set_valid_directions({
	S: r13,
	E: r15
	})
r15.set_valid_directions({
	W: r14
	})

r11.set_object("key")

rachel = Player.new("Rachel")
rooms = [r0,r1,r2,r3,r4,r5,r6]
horrorHouse = House.new(rooms,rachel,r1)

horrorHouse.main