class Midas
	attr_reader :gold

	def initialize(initialGold)
		@gold = initialGold
	end

	def takeGoldFrom(other)
		@gold += other.gold
		puts @gold
	end

	protected
	def gold
		@gold
	end

end

m1 = Midas.new(10)
m2 = Midas.new(20)
m1.takeGoldFrom(m2)
