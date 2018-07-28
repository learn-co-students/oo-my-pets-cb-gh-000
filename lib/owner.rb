class Owner

  @@all = []

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @@all << self
    @pets = { :fishes => [], :dogs => [], :cats => [] }
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{species}."
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
    pets[:dogs].each { |d| d.mood = "happy" }
  end

  def play_with_cats
    pets[:cats].each { |c| c.mood = "happy" }
  end

  def feed_fish
    pets[:fishes].each { |f| f.mood = "happy" }
  end

  def sell_pets
    pets.each do |k, v|
      pets[k].each { |o| o.mood = "nervous" }
    end
    pets.clear
  end

  def list_pets
    temp = []
    pets.each { |k, v| temp << v.size }
    "I have #{temp[0]} fish, #{temp[1]} dog(s), and #{temp[2]} cat(s)."
  end

end
