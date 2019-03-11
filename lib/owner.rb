class Owner
  # code goes here
  attr_accessor :name, :pets
   attr_reader :species

    @@all = []
   @@count = 0

  def initialize(species)
     @species = species
     @pets = {fishes: [], dogs: [], cats: []}

      @@all << self
  end

  def self.all
     @@all
  end

  def self.reset_all
     @@all = []
  end

  def self.count
     @@all.length
  end


  def say_species
     "I am a #{@species}."
  end

  def buy_fish(name)
     new_fish = Fish.new(name)
     self.pets[:fishes] << new_fish
  end

  def buy_dog(name)
     new_dog = Dog.new(name)
     self.pets[:dogs] << new_dog
  end

  def buy_cat(name)
     new_cat = Cat.new(name)
     self.pets[:cats] << new_cat
  end

  def walk_dogs
     @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
     @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
     @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |key, value|
      pets[key].each do |pet|
         pet.mood = "nervous"
      end
    end
     @pets = {dogs: [], cats: [], fishes: []}
 end

  def list_pets
     "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
