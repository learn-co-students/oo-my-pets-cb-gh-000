class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []
  
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
  end
  
  def self.all 
    @@all 
  end
  
  def self.reset_all
    @@all.clear 
  end
  
  def self.count 
    @@all.count 
  end
  
  def say_species
    "I am a #{self.species}."
  end 
  
  def buy_fish(name)
    Fish.new(name).tap {|fish| self.pets[:fishes] << fish}
  end 
  
  def buy_cat(name)
    Cat.new(name).tap {|cat| self.pets[:cats] << cat}
  end
  
  def buy_dog(name)
    Dog.new(name).tap {|dog| self.pets[:dogs] << dog}
  end
  
  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end
  
  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end
  
  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end
  
  def sell_pets 
    self.pets.each do |type, pets|
      pets.each {|pet| pet.mood = "nervous"}
      pets.clear
    end
  end
  
  def list_pets 
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end