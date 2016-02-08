class Car
	def initialize(engine,noise)
		@engine = engine
		@carNoise = noise
	end

	def make_noise
		puts @engine.make_noise + " " + @carNoise
	end

end

class Engine
	def initialize(noise)
		@engineNoise = noise
	end

	def make_noise
		@engineNoise
	end

end

_500CC = Engine.new("wiiiiii")
_V8 = Engine.new("brrRRRrrrmmm")
_chapuza = Engine.new("tikitikitiki")

herbie = Car.new(_500CC,"ToodleuDOOdoo")
kit = Car.new(_V8,"Hello Michael")
chitty = Car.new(_chapuza,"harUuga")
herbie.make_noise
chitty.make_noise
kit.make_noise

