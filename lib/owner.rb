class Owner
  # code goes here
  @@all = []

  attr_reader :name, :cats, :dogs, :species
  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def add_cat(cat)
    if self.cats.empty?
      @cats << cat
    elsif !self.cats.include?(cat)
      @cats << cat
    end
  end

  def add_dog(dog)
    if self.dogs.empty?
      @dogs << dog
    elsif !self.dogs.include?(dog)
      @dogs << dog
    end
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.remove_owner
      cat.mood = "nervous"
    end
    self.dogs.each do |dog|
      dog.remove_owner
      dog.mood = "nervous"
    end
    @cats = []
    @dogs = []
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
