class Owner
  attr_reader :species
  attr_accessor :name, :pets
  
  @@owners =[]
  
  def initialize(species)
    @species = species
    @pets={fishes: [], cats: [], dogs: []}
    @@owners << self 
  end  
  
  def self.all 
    @@owners 
  end   
  
  def species
    @species 
  end   
  
  def say_species
    "I am a #{@species}."
  end   
    
  
  def self.count
    @@owners.count
  end   
  
  def buy_fish(name)
    name = Fish.new(name)
    @pets[:fishes] << name 
  end   
  
  def buy_cat(name)
    name = Cat.new(name) 
    @pets[:cats] << name 
  end   
  
  def buy_dog(name)
    name = Dog.new(name) 
    @pets[:dogs] << name 
  end  
    
  def self.reset_all 
    @@owners.clear
  end  
  
  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = "happy"
    end 
  end   
  
  def play_with_cats 
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end   
  end   
  
  def feed_fish 
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end   
  end   
  
  def sell_pets 
    pets.each do |type, pet|
        pet.each do |animal|
        animal.mood = "nervous"
       end  
       pet.clear
    end   
  end   
  
  def list_pets 
    fish = pets[:fishes].count 
    dog = pets[:dogs].count 
    cat = pets[:cats].count 
    "I have #{fish} fish, #{dog} dog(s), and #{cat} cat(s)."
   end  
end