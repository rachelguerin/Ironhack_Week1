myhash = {
	wat: [ 0,1, {wut:[ 0, [ [ 0,1,2,3,4,5,6,7,8,{bbq: "You fucking legend!"} ]]]}]
}

puts "My hash: #{myhash[:wat][2][:wut][1][0][9][:bbq]}"
# puts myhash[:wat][2][:wut][1][0][9][:bbq]

myarray = [
	[
		{},{},{},{},{},{
			secret: { 
				unlock: [0,"Woop woop! Dance party.."]
			}
		}
	]
]

puts myarray[0][5][:secret][:unlock][1]