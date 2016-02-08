class WordChain
	def initialize(dictionary)
		@dictionary = dictionary
	end

	def find_chain(start,finish)
		if start.length != finish.length
			puts "words are not the same length"
		end

	end
end

my_chain = WordChain.new(???)
my_chain.find_chain("cat","dog")