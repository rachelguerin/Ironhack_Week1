require 'pry'

class Password
	def self.get_password
		action = ""
		while action != "esc" do
			puts "Enter your password:"
			pwd = gets.chomp

			if pwd == "foo"
				action = "esc"
			else 
				puts "That is not a valid password."
			end
		end
		pwd
	end
end

class User

	def self.get_user
		action = ""
		while action != "esc" do
			puts "Enter your username:"
			user = gets.chomp

			if user.length != 0
				action = "esc"
			else
				puts "That is not a valid username."
			end
		end
		user
	end
end

class Text

	def self.count_words
		puts "Enter your text for the word count:"
		text = gets.chomp.split.size


	end
end

class CommandLine

	def main
		User.get_user
		Password.get_password

		puts "There are #{Text.count_words} words in the text."
		
	end
end

myCmd = CommandLine.new

myCmd.main