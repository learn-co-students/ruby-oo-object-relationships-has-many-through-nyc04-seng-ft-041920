class Waiter
    attr_accessor :name, :experience
    @@all = []

    def initialize(name, experience)
        @name = name 
        @experience = experience

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        tipper_string = nil
        x = 0

        meals.detect do |meal|
            if meal.waiter == self
               if meal.tip > x
                    x = meal.tip 
                    tipper_string = meal.customer
                end
            end
        end
        
        tipper_string
    end
end