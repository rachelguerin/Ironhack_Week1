class Employee
	attr_reader :name,:email
	def initialize(name,email)
		@name = name
		@email = email
	end
	def calculate_net_salary(tax)
		self.calculate_gross_salary * tax
	end
end

class HourlyEmployee < Employee
	def initialize(name,email,hourly_rate,hours)
		super name,email
		@hourly_rate = hourly_rate
		@hours = hours
	end

	def calculate_gross_salary
		@hourly_rate * @hours
	end

end

class SalariedEmployee < Employee
	def initialize(name,email,salary)
		super name, email
		@salary = salary
	end

	def calculate_gross_salary
		@salary / 52
	end
end

class MultiPaymentEmployee < Employee
	def initialize(name,email,base_salary,overtime_rate,hours)
		super name, email
		@base_salary = base_salary
		@overtime_rate = overtime_rate
		@hours = hours
	end

	def calculate_gross_salary
		
		weekly_salary = @base_salary / 52

		if @hours > 40
			weekly_salary += (@hours - 40) * @overtime_rate
		end

		return weekly_salary
	end

end

class Payroll
	def initialize(employees)
		@employees = employees
		@total = 0
	end
	def pay_employees
		@employees.each do |employee|
			net_salary = employee.calculate_net_salary(0.18)
			@total += net_salary
			self.notify_employee(employee)
			puts "#{employee.name} => #{net_salary}"
		end
		return @total
	end
	def notify_employee(employee)
		puts "A mail has been sent to #{employee.name}"
	end

end

josh = HourlyEmployee.new('Josh','josh@email.com',35,50)
nizar = SalariedEmployee.new('Nizar','nizar@email.com',1000000)
ted = MultiPaymentEmployee.new('Ted','ted@email.com',60000,275,55)
rachel = HourlyEmployee.new("rachel", "rachel@email.com", 15, 40)
javi = HourlyEmployee.new("javi", "javi@mail.com", 15, 50)


# myPayroll.addEmployee(josh)
# myPayroll.addEmployee(nizar)
# myPayroll.addEmployee(ted)


employees = [josh,nizar,ted, rachel, javi]

myPayroll = Payroll.new(employees)

puts myPayroll.pay_employees

# puts "Josh's salary: #{josh.calculateSalary}"

# puts "Nizar's salary: #{nizar.calculateSalary}"

# puts "Ted's salary: #{ted.calculateSalary}"