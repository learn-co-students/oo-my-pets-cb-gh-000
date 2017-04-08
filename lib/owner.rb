class Owner
  @@all = []
  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
      @species = species
      @pets = {fishes:[], dogs:[], cats:[]}
      @@all << self
  end

  def self.all
      @@all
  end

  def self.reset_all
      @@all.clear
  end

  def self.count
      @@all.length
  end

  def say_species
      "I am a #{species}."
  end

  def buy_fish(fishname)
      @pets[:fishes] << Fish.new(fishname)
  end

  def buy_cat(catname)
      @pets[:cats] << Cat.new(catname)
  end

  def buy_dog(dogname)
      @pets[:dogs] << Dog.new(dogname)
  end

  def walk_dogs
      @pets[:dogs].each {|dog| dog.mood = 'happy'}
  end

  def play_with_cats
      @pets[:cats].each {|cat| cat.mood = 'happy'}
  end

  def feed_fish
      @pets[:fishes].each {|fish| fish.mood = 'happy'}
  end

  def sell_pets
      pets.each do |s, p|
          p.each do |pet|
              pet.mood = "nervous"
          end
        p.clear
        end
  end

  def list_pets
      "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end
end
