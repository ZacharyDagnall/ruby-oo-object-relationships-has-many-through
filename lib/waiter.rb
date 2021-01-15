require 'pry'

class Waiter
    attr_accessor :name, :years_of_experience
    @@all = []

    def initialize(name, yoe)
        @name = name
        @years_of_experience = yoe
        self.save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter==self}
    end

    def best_tipper
        (self.meals.max{|mealA, mealB| mealA.tip <=> mealB.tip}).customer
    end

end