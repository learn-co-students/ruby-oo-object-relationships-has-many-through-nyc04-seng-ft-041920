class Customer
  attr_reader :name
  attr_accessor :age

    @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    meal = Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def waiters
    self.meals.collect do |meal|
        if meal.customer == self
            meal.waiter
        end
    end
  end
end