# Gaining a deeper understanding of object relations, and building classes that
# produce objects that interact with one another through associations and behavior.
class Owner
  # Method initializes the instance variables needed for the class to function.
  attr_accessor :name, :pets
  attr_reader :species
  def initialize(name)
    # Initializes the name of the owner.
    @name = name
    # Initializes a hash for the three different species of pets available to
    # have, with the value of each key being an empty array that can be filled
    # with many different pets.
    @pets = {fishes: [], cats: [], dogs: []}
    # Initializes what the species the owner is.
    @species = "human"
    # Pushes the current instance (object) of the 'Owner' into the '@@all'
    # array to keep track of the 'Owners' that have been created.
    @@all << self
  end


  # Method initializes and returns the class variable '@@all' into an empty array.
  @@all = []
  def self.all
    return @@all
  end


  # Method returns a cleared (reset) class variable '@@all' array.
  def self.reset_all
    return @@all.clear
  end


  # Method retuns the number of elements (owners) in the class variable '@@all' array.
  def self.count
    return @@all.length
  end


  # Method returns a string of what species the current 'Owner' is.
  def say_species
    return "I am a #{species}."
  end


  # Methods 'buy' (create) a new instance of one of the three pet classes, and
  # then push it into the instance variable '@pets' array.
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


  # Method interacts with pet from their respective arrays, iterating through
  # each element (pet) to update each of their moods to 'happy'.
  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end
  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end
  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end


  # Method first iterates through each element (pet) and updates their mood to
  # 'nervous' before 'selling' them (clearing all arrays).
  def sell_pets
    @pets[:dogs].each do |dog|
      dog.mood = "nervous"
    end
    @pets[:dogs].clear
    @pets[:cats].each do |cat|
      cat.mood = "nervous"
    end
    @pets[:cats].clear
    @pets[:fishes].each do |fish|
      fish.mood = "nervous"
    end
    @pets[:fishes].clear
  end


  # Method returns the amount of fish, dogs, and cats that are associated with
  # the current 'Owner' object.
  def list_pets
    fish_num = @pets[:fishes].length
    dog_num = @pets[:dogs].length
    cat_num = @pets[:cats].length
    return "I have #{fish_num} fish, #{dog_num} dog(s), and #{cat_num} cat(s)."
  end
end
