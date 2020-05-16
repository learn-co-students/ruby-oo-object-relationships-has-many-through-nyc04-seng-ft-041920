class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip) # takes args bc it says 👏P👏R👏O👏V👏I👏D👏E👏D👏
    Meal.new(self, total, tip, waiter)
  end

  def meals
    Meal.all.select { |meal| meal.customer == self }
    # when you do readme explainer, try to tackle why you use every method because just plugging in the first one that works is too much of a bold strategy
  end

  def waiters
    # array of waiter instances
    # call meals-- this has the array with meals tied to customer, would surely have the waiters too
    self.meals.collect { |meal| meal.waiter }
    # OPAAAAA
  end

end
