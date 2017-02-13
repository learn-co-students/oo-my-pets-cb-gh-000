require 'pry'
class Owner

  @@all = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
    @@all << self
    @species = species
    clear_pets
  end

  def buy_cat(cat_name)
    @pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    @pets[:dogs] << Dog.new(dog_name)
  end

  def buy_fish(fish_name)
    @pets[:fishes] << Fish.new(fish_name)
  end

  def clear_pets
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => [],
    }
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.eats}
  end

  def list_pets
    pet_count = {}
    @pets.each {|type, pets| pet_count[type] = pets.count}
    "I have #{pet_count[:fishes]} fish, #{pet_count[:dogs]} dog(s), and #{pet_count[:cats]} cat(s)."
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.plays}
  end

  def sell_pets
    @pets.each do |type, pets|
      pets.each do |pet|
        pet.new_owner
      end
    end
    clear_pets
  end

  def say_species
    "I am a #{@species}."
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.walks}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

end
