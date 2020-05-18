require 'pry'
class Customer
  attr_reader :name, :age

  @@all = []

  def initialize customer_name, customer_age
    @name = customer_name
    @age = customer_age

    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal waiter_obj, total_input, tip_input
    Meal.new(waiter_obj, self, total_input, tip_input)
  end

  def meals
    # binding.pry
    Meal.all.select { |meal_ins|  meal_ins.customer == self}
  end

  def waiters
    # binding.pry
    #We use the instance method 'meals' that returns all the meals of the current customer instance 'self'. we use the 'collect' enumerable to return a new array with only the waiters instance or objects.
    self.meals.collect { |meal_ins| meal_ins.waiter}
  end

end

# cust1 = Customer.new("jeff", 24)
# cust2 = Customer.new("jas", 20)

# p Customer.all
