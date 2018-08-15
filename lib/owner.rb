class Owner
  # code goes here
  #
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species = 'human')
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    puts "I am a #{@species}."
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

  def walk_dogs
    @pets[:dogs].map do |animal|
      animal.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].map do |animal|
      animal.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].map do |animal|
      animal.mood = "happy"
    end
  end

  def sell_pets
    @pets.map do |kind, pet|
      pet.map do |name|
        name.mood = "nervous"
      end
    end
    @pets.map do |kind, pet|
      pet.clear
    end
  end

  def list_pets
    puts "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
    return "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end

end
