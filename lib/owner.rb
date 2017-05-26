class Owner
  # code goes here
  @@all = []

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end


  attr_accessor :name, :pets # pets should be gettable only, but specs fail.
  attr_reader :species

  def initialize(species)
    @name = name
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    @pets.each do |pet_type, pets|
      pets.each { |pet| pet.mood = "nervous" }
      pets.clear
    end
  end

  def list_pets
    f = @pets[:fishes].count
    d = @pets[:dogs].length
    c = @pets[:cats].size
    "I have #{f} fish, #{d} dog(s), and #{c} cat(s)."
  end

end
