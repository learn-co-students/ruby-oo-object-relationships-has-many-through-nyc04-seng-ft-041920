class Customer
    attr_accessor :name, :age
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
        Meal.new(waiter, self, total, tip)
    end
    
    def meals
        Meal.all.select do |my_meal|
            my_meal.customer == self
        end
    end

    def waiters
        waiter_array = []
        meals.each do |meals|
            if meals.customer == self
                waiter_array << meals.waiter
            end
        end
        
        waiter_array
    end
end

=begin
1. Create a function #waiters that returns a new array of waiters that are associated with self
    def waiters
        waiter_array = []
        meals.each do |meals|
            if meals.customer == self
                waiter_array << meals.waiter
            end
        end
        
        waiter_array
    end

2.

=end