class Owner

    attr_accessor :name, :pets
    attr_reader :species

    @@all = []

    def initialize(species)
        @@all << self
        @species = species
        @pets = {:fishes => [], :dogs => [], :cats => []}
    end

    def self.all
        @@all
    end

    def self.count
        @@all.count
    end

    def self.reset_all
        @@all.clear
    end

    def say_species
        "I am a human."
    end

    def buy_fish(fishName)
        newFish = Fish.new(fishName)
        @pets[:fishes] << newFish
    end

    def buy_cat(catName)
        newCat = Cat.new(catName)
        @pets[:cats] << newCat
    end

    def buy_dog(dogName)
        newDog = Dog.new(dogName)
        @pets[:dogs] << newDog
    end

    def walk_dogs
        @pets[:dogs].each do |dog|
            dog.mood = "happy"
        end
    end

    def play_with_cats
        @pets[:cats].each do |cat|
            cat.mood = "happy"
        end
    end

    def feed_fish
        @pets[:fishes].each do |fish|
            fish.mood = "happy"
        end
    end

    def sell_pets
        @pets.each do |type, petList|
            petList.each do |pet|
                pet.mood = "nervous"
            end
        end
        @pets.clear
    end

    def list_pets
        "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
    end

end
