class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

  def initialize name
    @name = name
    @species = "human"
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def say_species
    return "I am a #{self.species}."
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
   self.pets[:dogs].each{|dog| dog.mood = "happy"}
 end

 def play_with_cats
   self.pets[:cats].each{|cat| cat.mood = "happy"}
 end

 def feed_fish
   self.pets[:fishes].each{|fish| fish.mood = "happy"}
 end

 def sell_pets
   self.pets.each do |key,val|
     val.each{|p| p.mood = "nervous"}
   end
   self.pets.clear
 end

 def list_pets
   return "I have #{self.pets[:fishes].size} fish, #{self.pets[:dogs].size} dog(s), and #{self.pets[:cats].size} cat(s)."
 end

end
