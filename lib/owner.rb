class Owner
  # code goes here

  @@owners = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
    @species = species
    @@owners << self
    @pets = { :fishes => [], :dogs => [], :cats => [] }
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.count
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
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
    pets.each do |pet_type, pet_group|
      pet_group.each do |pet|
        pet.mood = "nervous"
      end
      pet_group.clear
    end
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end


# Owner Class methods keeps track of the owners that have been created
# Owner Class methods can reset the owners that have been created
# Owner Class methods can count how many owners have been created

# Owner instance methods #species initializes with a species
# Owner instance methods #species can't change its species

# Owner instance methods #say_species  can say its species

# Owner instance methods #name can have a name
# Owner instance methods #pets is initialized with a pets attribute as a hash with 3 keys
# Owner instance methods #buy_fish can buy a fish that is an instance of the Fish class
# Owner instance methods #buy_cat can buy a cat that is an instance of the Cat class
# Owner instance methods #buy_cat knows about its cats
# Owner instance methods #buy_dog can buy a dog that is an instance of the Dog class
# Owner instance methods #buy_dog knows about its dogs
# Owner instance methods #walk_dogs walks the dogs which makes the dogs' moods happy
# Owner instance methods #play_with_cats plays with the cats which makes the cats moods happy
# Owner instance methods #feed_fish feeds the fishes which makes the fishes' moods happy
# Owner instance methods #sell_pets can sell all its pets, which make them nervous
# Owner instance methods #list_pets can list off its pets
