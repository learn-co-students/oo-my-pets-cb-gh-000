class Owner

    attr_reader :name, :species

    @@all = []

    def initialize(name)
      @name = name
      @species = "human"
      @@all << self
    end

    def say_species
      "I am a #{@species}."
    end

    def self.all
      @@all
    end

    def self.count
      @@all.size
    end

    def self.reset_all
      @@all.clear
    end

    def cats
      Cat.all.collect {|cat| cat if cat.owner = self}
    end

    def dogs
      dogs = []
      Dog.all.collect {|dog| dog if dog.owner = self}
      dogs
    end

    def buy_cat(cat)
      Cat.all.each {|cat| cat.owner = self if cat.name == name}
    end

    def buy_dog(dog)
      Dog.all.each {|dog| dog.owner = self if dog.name == name}
    end

    def walk_dogs
      self.dogs.each {|dog| dog.mood = "happy"}
    end

    def feed_cats
      self.cats.each {|cat| cat.mood = "happy"}
    end

    def sell_pets
      self.dogs.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil
      end
      self.cats.each do |cat|
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
end
