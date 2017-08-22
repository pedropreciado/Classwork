class Employee
  attr_reader :salary, :name, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def add_employee(boss)
    boss.employees.push(self)
  end
end
