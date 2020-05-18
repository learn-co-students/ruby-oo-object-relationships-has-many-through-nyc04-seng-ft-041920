class Waiter
  attr_reader :name, :experience

  @@all = []

  def initialize waiter_name, waiter_exp
    @name = waiter_name
    @experience = waiter_name

    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal customer_ins, total_input, tip_input
    Meal.new(self, customer_ins, total_input, tip_input)
  end

  def meals
    Meal.all.select { |meal_ins| meal_ins.waiter == self}
  end

  def best_tipper
    # This one was bit tricky, so first we are going to use the 'meals' instance that returns an array of all the meals the current waiter instance has. Then we check the for the max tip meal instance using the max enumerable for arrays.
    # And we create a local var that is going to hold the highest meal object
    highest_tip_meal = self.meals.max{|a, b| a.tip <=> b.tip}
    # Finally we return the customer obj of that meal instance
    highest_tip_meal.customer
  end

end
