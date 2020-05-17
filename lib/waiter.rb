class Waiter 
  attr_accessor :name, :yrs_experience
  @@all = []

  def initialize(name, yrs_experience) 
    @name = name
    @yrs_experience = yrs_experience

    @@all << self
  end

  # (customer, waiter, meal, tip=0)
  def new_meal(customer, meal, tip)
    Meal.new(customer, self, meal, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    best_tipped_meal = self.meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end

  def self.all
    @@all
  end
end