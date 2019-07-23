require 'pry'

class Owner
  @@all= []

  attr_accessor  :cats, :dogs
  attr_reader :species,:name

  # Instance Methods #

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
    @cats = []
    @dogs = []
  end

  def name
    @name
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_cat(name_of_cat)
    Cat.new(name_of_cat, self)
  end

  def buy_dog(name_of_dog)
    Dog.new(name_of_dog, self)
  end

  def walk_dogs
    @dogs.each do |instance|
          instance.mood = "happy"
    end
  end

  def feed_cats
    @cats.each do |instance|
          instance.mood = "happy"
    end
  end

  def sell_pets
    @cats.each do |instance|
          instance.mood = "nervous"
          instance.owner = nil
    end
    @dogs.each do |instance|
          instance.mood = "nervous"
          instance.owner = nil
    end
    @cats.clear
    @dogs.clear
  end

  def list_pets
    num_dogs = @dogs.size
    num_cats = @cats.size
    return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

  # Class Methods #

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end
end
