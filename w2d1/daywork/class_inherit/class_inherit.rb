class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary*multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss = nil )
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
    nil
  end

  def bonus(multiplier)
    @employees.reduce(0) {|sum, employee| sum + employee.salary } * multiplier
  end
end

ned = Manager.new("ned", "founder", 1000000)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Employee.new("shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
ned.add_employee(darren)
ned.add_employee(shawna)
ned.add_employee(david)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
