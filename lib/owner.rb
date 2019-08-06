class Owner

  @@all = []
  attr_accessor :pets
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {cats:[], dogs: []}
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def buy_cat(name)
   name = Cat.new(name, self)
  end

  def buy_dog(name)
   name = Dog.new(name, self)
  end

  def cats
    @pets[:cats]
  end

  def dogs
    @pets[:dogs]
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |petList, pets|
      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
      pets.clear
    end
  end

  def list_pets
    return "I have #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
