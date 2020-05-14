class Waiter

    @@all = []
    attr_accessor :name, :experience
    
    def initialize(name, experience)
        @name = name 
        @experience = experience
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals 
        Meal.all.select{|meal| meal.waiter == self}
    end 

    def best_tipper 
       meal_with_highest_tip = self.meals.max {|mealA, mealB|  mealA.tip <=> mealB.tip}
       meal_with_highest_tip.customer
    end     
end