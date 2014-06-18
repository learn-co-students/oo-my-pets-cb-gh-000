class Owner
  OWNERS = []
  attr_accessor :name, :pets
  def self.reset_all
    OWNERS.clear
  end

  def initialize(name)
    OWNERS << self
    @name = name
    @pets = {:fishes => [], :dogs =>, :cats => []}
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def buy_cat(name)
    pets[:cat] << Cat.new(name)
  end

  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets = {:fishes => [], :dogs =>, :cats => []}
  end

end
