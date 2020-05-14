class Waiter
    attr_reader :name
    attr_accessor :years_of_exp

    @@all = []

    def initialize(name, years_of_exp)
        @name = name
        @years_of_exp = years_of_exp
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        tipper = nil
        best_tip = 0
        self.meals.each do |meal|
            if meal.tip > best_tip
                best_tip = meal.tip
                tipper = meal.customer
            end
        end
        tipper
    end
end