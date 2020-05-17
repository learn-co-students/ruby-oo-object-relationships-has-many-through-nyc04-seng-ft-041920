class Meal
  attr_accessor :customer, :waiter, :meal, :tip
  @@all = []

  def initialize(customer, waiter, meal, tip=0)
    @customer = customer
    @waiter = waiter
    @meal = meal
    @tip = tip

    @@all << self
  end

  def self.all
    @@all
  end
end 