class Customer
  attr_accessor :name, :age
  @@all = []
  
  def initialize(name, age)
    @name = name
    @age = age

    @@all << self
  end

  # (customer, waiter, meal, tip=0)
  def new_meal(waiter, meal, tip)
    Meal.new(self, waiter, meal, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer == self }
  end

  def waiters
    self.meals.map { |meal| meal.waiter }.uniq
  end

  def last_waiter 
    self.waiters.last.name
  end

  def self.all
    @@all 
  end

end