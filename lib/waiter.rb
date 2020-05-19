class Waiter

    attr_accessor :name, :years_experience
    @@all = []

    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter=self, customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipper = meals.max do |a_meal, b_meal|
            a_meal.tip <=> b_meal.tip
        end
        best_tipper.customer
    end

end