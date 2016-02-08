myArray = [1,2,3,4,5]

puts myArray.reduce { |sum,x| sum+x }

puts myArray.reduce(70) { |sum,x| sum+x }