class Owner

  attr_accessor :pets, :cat, :dog, :fish, :name
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @name = name
    @pets = {fishes: [],
            cats: [],
            dogs: []}
    @@all << self
  end

  def species
    @species
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.reset_all
    @@all = []
    return @@all
  end

  def self.all
    return @@all
  end

  def self.count
    @@all.size
  end

  def buy_fish(fish_name)
    fish = Fish.new(fish_name)
    @pets[:fishes] << fish
  end


  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets[:fishes].each do |fish|
      fish.mood = "nervous"
    end

    @pets[:cats].each do |cat|
      cat.mood = "nervous"
    end

    @pets[:dogs].each do |dog|
      dog.mood = "nervous"
    end

    @pets = {fishes: [],
            cats: [],
            dogs: []}
  end

  def list_pets
    return "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
