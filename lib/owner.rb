class Owner
  # code goes here
  
  @@all = []
  
  attr_reader :species 
  attr_accessor :name, :pets 
  
  def initialize( species)
    self.class.all << self
    @species = species 
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end 

  def self.all 
    @@all 
  end 
  
  def self.count
    self.all.count
  end 
  
  def self.reset_all
    @@all = []
  end
  
  def say_species
    return "I am a #{self.species}."
  end 
  
  def buy_fish(name)
    new = Fish.new(name)
    self.pets[:fishes] << new 
  end 
  
  def buy_cat(name)
    new = Cat.new(name)
    self.pets[:cats] << new 
  end
  
  def buy_dog(name)
    new = Dog.new(name)
    self.pets[:dogs] << new 
  end 
  
  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood = "happy" }
  end 
  
  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood = "happy" }
  end 
  
  def feed_fish
    self.pets[:fishes].each { |fish| fish.mood = "happy" }
  end
  
  def sell_pets
    self.pets[:fishes].each { |pet| pet.mood = "nervous" }
    self.pets[:cats].each { |pet| pet.mood = "nervous" }
    self.pets[:dogs].each { |pet| pet.mood = "nervous" }
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end 
  
  def list_pets
    return "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end 
  
end
