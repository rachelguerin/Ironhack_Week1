classmates = { Javier: 22,
Rashed: 25,
Adrián: 30,
JuanAntonio: 33,
JLucas: 22,
Mario: 23,
JoséMaría: 45,
Christopher: 35,
Joaquín: 28,
Elisa: 24,
Manuel: 30,
Pau: 35,
Rubén: 37,
Rachel: 22,
Juan: 29 }

oldmates = classmates.select { |name,age| age > 25 }
oldmates.each { |name,age| puts "#{name} is #{age} years old."}
newmates = classmates.select { |name,age| age <= 25 }
newmates.each { |name,age| puts "#{name} is #{age} years old."}

somemates = classmates.select { |name,age| name == "Mario".to_sym || name == "Adrián".to_sym }
somemates.each { |name,age| puts "#{name} is #{age} years old."}