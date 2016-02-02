class ProgrammingLanguage
	attr_accessor :name, :age, :type
	def initialize (name, age, type)
		@name = name 
		@age = age
		@type =type
	end
end
def array_printer (array)
	array.each {|item| puts "Language: #{item.name} | #{item.age} | #{item.type}"}		
end

def array_printer_downcase (array)
	puts array.map {|item| item.name.downcase}
end


	

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

aged_languages = array_of_languages.map {|item| ProgrammingLanguage.new(item.name, item.age += 1, item.type)} 

sorted_by_age = array_of_languages.sort {|a,b| b.age <=> a.age} 

# no_java = array_of_languages.delete_if {|item| item.name.downcase == "java" }

# no_java_no_js = array_of_languages.delete_if { |item| item.name.include?("Java") }

shuffled = sorted_by_age.shuffle

old_languages = array_of_languages.select { |lang| lang.age > 18 }

array_printer(old_languages)

# array_printer(array_of_languages)
# array_printer_downcase(array_of_languages)
# array_printer(aged_languages)
# # array_printer(sorted_by_age)
# array_printer(no_java)
# array_printer(no_java_no_js)
# array_printer(shuffled)

longest = array_of_languages.reduce { |long,lang| long.name.length < lang.name.length ? lang : long }
puts longest.name


sum_age = array_of_languages.reduce(0) { |sum,x| sum + x.age }
puts (sum_age / array_of_languages.length)