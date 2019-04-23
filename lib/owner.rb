class Owner
  attr_accessor :name , :pets
  attr_reader :species

  @@all = []


  def initialize(species)
    @species = species
    @pets = { fishes: [], dogs: [], cats: [] }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(pet)
    fish = Fish.new(pet)
    @pets[:fishes] << fish
  end

  def buy_cat(pet)
    cat = Cat.new(pet)
    @pets[:cats] << cat
  end

  def buy_dog(pet)
    dog = Dog.new(pet)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each{ |d| d.mood = 'happy' }
  end

  def play_with_cats
    @pets[:cats].each{ |c| c.mood = 'happy' }
  end

  def feed_fish
    @pets[:fishes].each{ |f| f.mood = 'happy' }
  end

  def sell_pets
    @pets.each do |pet, arr|
     arr.each { |is| is.mood = 'nervous' }
      arr.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
