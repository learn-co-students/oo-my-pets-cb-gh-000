class Owner

  attr_reader :name, :species
  attr_accessor :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    @dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    @cats.map do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    @cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

    @dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end

    @dogs = []
    @cats = []


  end

  def list_pets
    return "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    return @@all.length
  end

  def self.reset_all
    @@all = []
  end
end
