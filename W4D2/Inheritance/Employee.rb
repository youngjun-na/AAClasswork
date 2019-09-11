class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :subordinates
  def initialize(name, title, salary, boss)
    super
    @subordinates = []
  end
  
  def add_employee(name)
    @subordinates << name
  end

  def bonus(multiplier)
    self.sub_salary * multiplier
  end
  
  def sub_salary
    sub_sal = 0
    @subordinates.each do |employee|
      if employee.class == Manager
        sub_sal += employee.salary
        sub_sal += employee.sub_salary
      else 
        sub_sal += employee.salary
      end
    end
    sub_sal
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren","TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
