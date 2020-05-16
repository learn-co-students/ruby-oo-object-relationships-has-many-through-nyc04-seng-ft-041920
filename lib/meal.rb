class Meal
  attr_reader :waiter, :customer, :total, :tip

  @@all = []

  def initialize(customer, total, tip=0, waiter)
    @customer = customer
    @total = total
    @tip = tip
    @waiter = waiter
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
