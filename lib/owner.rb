class Owner
  # code goes here
  @@all = []

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @@all << self
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    "I am a #{self.species}."
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
    @pets[:dogs].each{ |dog| dog.mood = 'happy' }
  end

  def play_with_cats
    @pets[:cats].each{ |cat| cat.mood = 'happy' }
  end

  def feed_fish
    @pets[:fishes].each{ |fish| fish.mood = 'happy' }
  end

  def sell_pets
    @pets.each do |type, pets|
      pets.each{ |pet| pet.mood = "nervous" }
      pets.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
