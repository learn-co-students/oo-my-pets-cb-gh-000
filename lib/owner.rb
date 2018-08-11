require 'pry'

class Owner
  # code goes here
  attr_accessor :pets, :name
  
  attr_reader :species
  
  @@all = []
  
  def initialize(species="")
    @species = species  
    @pets = { :fishes=>[], :dogs=>[], :cats=>[] }
    
    @@all << self
  end

  def self.all
    @@all
  end 
  
  def self.count
    @@all.length
  end 
  
  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end
  
  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end 
  
  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
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
    @pets[:dogs].each {|dog| dog.mood = "nervous"}
    @pets[:cats].each {|cat| cat.mood = "nervous"}
    @pets[:fishes].each {|fish| fish.mood = "nervous"}
    @pets = { :fishes=>[], :dogs=>[], :cats=>[] }
  end 
  
  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end 
  
end