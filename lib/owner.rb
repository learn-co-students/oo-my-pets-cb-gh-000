class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = { fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def make_happy(pet)
    pet.mood = "happy"
  end

  def walk_dogs
    @pets[:dogs].each(&method(:make_happy))
  end

  def play_with_cats
    @pets[:cats].each(&method(:make_happy))
  end

  def feed_fish
    @pets[:fishes].each(&method(:make_happy))
  end

  def sell_pets
    @pets.each do |type, pets|
      pets.each { |pet| pet.mood = 'nervous' }
    end
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.count
  end

end
