class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
    @@all << self
  end

  def self.reset_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each{ |dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each{ |cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each{ |fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.values.flatten.each {|pet| pet.mood = "nervous"}
    self.pets.keys.each { |type| self.pets[type] = [] }
  end

  def list_pets
    return "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
