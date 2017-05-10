class Owner
  # code goes here
  attr_accessor :name,:pets
  attr_reader :species
  @@all = []

  def initialize(name)
    @species = name
    @@all << self
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.length
  end

  def say_species
    "I am a #{@species}."
  end

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

  def change_mood(pet,mood)
    pet.mood = mood;
  end

  def walk_dogs
    @pets[:dogs].each{|dog| change_mood(dog,'happy')}
  end

  def play_with_cats
    @pets[:cats].each{|cat| change_mood(cat,'happy')}
  end

  def feed_fish
    @pets[:fishes].each{|fish| change_mood(fish,'happy')}
  end

  def sell_pets
    @pets.each do |species,pets|
      pets.each{|pet| change_mood(pet,'nervous')}
    end
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
