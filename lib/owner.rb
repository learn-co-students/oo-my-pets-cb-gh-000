class Owner
  # code goes here
  attr_accessor :pets, :name
  attr_reader :species

  @@owners = []

  def initialize(species, pets = {:fishes => [], :dogs => [], :cats => []})
    @species = species
    @pets = pets
    @@owners << self
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

  ##instance methods
def say_species
   "I am a #{self.species}."
end

  def pets
     @pets
  end
  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
     @pets[:dogs] << Dog.new(name)
  end

  def buy_fish(name)
     @pets[:fishes] << Fish.new(name)
  end

  def walk_dogs
     self.pets[:dogs].each do |dog|
       dog.mood = "happy"
     end
  end

  def play_with_cats
     self.pets[:cats].each do |cat|
       cat.mood = "happy"
     end
  end

  def feed_fish
     self.pets[:fishes].each do |fish|
       fish.mood = "happy"
     end
  end

  def sell_pets
    pets.each do |type, pets|
      pets.map {|pet| pet.mood = "nervous"}
    end
    pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end


end
