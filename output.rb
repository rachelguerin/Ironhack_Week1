class Output
	def self.ioOutput(file,text)
		IO.write(file,text)
	end

	def self.screenOutput(text)
		puts text
	end

	def self.queueOutput(text)
		Queue.put(text)
	end

	def self.httpOutput(text)
		HTTP.post(text)
	end

	def self.logstashOutput(text)
		Logstash.add(text)
	end

	def self.logWatchOutput(text)
		LogWatch.new.post(text)
	end

end




text = "Hello World"
logfile = "log.log"

Output.ioOutput(text,logfile)
Output.screenOutput(text)
Output.queueOutput(text)
Output.httpOutput(text)
Output.logstashOutput(text)
Output.logWatchOutput(text)





