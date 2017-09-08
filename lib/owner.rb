class Owner
  attr_accessor :name, :pets, :count
  attr_reader :species

  @@owners = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
    @@owners << self
    @@count += 1
  end

  def self.all
    @@owners
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@owners.clear
    @@count = 0
  end

  def say_species
    "I am a human."
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
    dogs = @pets[:dogs]
    dogs.each do |d|
      d.mood = "happy"
    end
  end

  def play_with_cats
    cats = @pets[:cats]
    cats.each do |c|
      c.mood = "happy"
    end
  end

  def feed_fish
    fish = @pets[:fishes]
    fish.each do |f|
      f.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |key, animal|
      animal.each do |a|
        a.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    num_fish = @pets[:fishes].count
    num_dogs = @pets[:dogs].count
    num_cats = @pets[:cats].count
    "I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

end
