class Owner
  # code goes here
  @@all = []
  attr_accessor :pets, :name
  attr_reader :species
  def initialize(species)
    @species = species
    self.class.all << self
    self.pets = {
      dogs: [],
      cats: [],
      fishes: []
    }
  end

  def self.all
      @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each { |e| e.mood = "happy" }
  end

  def play_with_cats
    self.pets[:cats].each { |e| e.mood = "happy" }
  end

  def feed_fish
    self.pets[:fishes].each { |e| e.mood = "happy" }
  end

  def sell_pets
    self.pets
      .values
      .flatten
      .each { |e| e.mood = "nervous" }
    self.pets = {
      dogs: [],
      cats: [],
      fishes: []
    }
  end
  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end
