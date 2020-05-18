class Meal
  attr_reader :waiter, :customer, :total, :tip

  @@all = []

  def initialize waiter_obj, customer_obj, total, tip
    @waiter = waiter_obj
    @customer = customer_obj
    @total = total
    @tip = tip

    @@all << self
  end

  def self.all
    @@all
  end

end
