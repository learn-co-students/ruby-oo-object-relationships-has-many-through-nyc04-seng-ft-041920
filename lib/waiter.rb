require 'pry'

class Waiter
  attr_accessor :name, :years_of_experience

  @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(customer, total, tip, self)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    # gotta go back and give a value to the tip -- DONE
    # self.meals is an array
    sorted = self.meals.sort_by { |meal| meal.tip }.reverse
    sorted[0].customer
  end

end
