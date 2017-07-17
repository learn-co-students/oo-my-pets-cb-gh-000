class Owner

  @@all = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(name)
    @name = name
    @species = "human"
    @pets = { fishes: [], dogs: [], cats: []}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def feed_fish
    make_animals_happy(self.pets[:fishes])
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def play_with_cats
    make_animals_happy(self.pets[:cats])
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    make_animals_happy(self.pets[:dogs])
  end

  def sell_pets
    self.pets.each do |species, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

  private

  def make_animals_happy(animals)
    animals.each do |animal|
      animal.mood = "happy"
    end
  end

end
