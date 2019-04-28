class Owner
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets, :fish, :dog, :cat
  
  
  def initialize(species)
    @@all << self
    @species = species
    @pets = {:cats => [], :dogs => [], :fishes => []}
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
  
  def species
    @species
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def pets
    @pets
  end
  
  def buy_fish(fish)
    @pets[:fishes] << Fish.new(fish)
  end
  
  def buy_cat(cat)
    @pets[:cats] << Cat.new(cat)
  end
  
  def buy_dog(dog)
    @pets[:dogs] << Dog.new(dog)
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
    @pets.collect do |species, instances|
      instances.each do |pet|
        pet.mood= "nervous"
      end
      instances.clear
    end 
  end
  
  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
end