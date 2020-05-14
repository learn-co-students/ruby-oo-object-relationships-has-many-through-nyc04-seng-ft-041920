class Waiter

    attr_reader :name, :year_experience
    @@all = []

    def initialize(name, year_experience)
        @name = name
        @year_experience = year_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        #binding.pry
        best_tipper  = meals.sort_by{|meal| meal.tip}
        best_tipper.last.customer
    end
end