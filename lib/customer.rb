require 'pry'
class Customer
  @@all = []
  attr_accessor :name,:age
  def initialize(name,age)
    @name = name
    @age = age
    @@all << self
  end



  def self.all
  @@all
  end

  # howard.new_meal(terrance, 10, 1)

  # # waiter, a customer, a total and a tip
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer == self}
end

  def waiters 
    meals.map { |meal| meal.waiter }
  end

end