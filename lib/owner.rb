class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def initialize(name)
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @species = "human"

    @@all << self
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

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def list_pets
    cat_length = @pets[:cats].length
    dog_length = @pets[:dogs].length
    fish_length = @pets[:fishes].length

    "I have #{fish_length} fish, #{dog_length} dog(s), and #{cat_length} cat(s)."
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def say_species
    "I am a #{@species}."
  end

  def sell_pets
    @pets.each do |species, pets|
      pets.each { |pet| pet.mood = "nervous" }
      pets.clear
    end
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end
end
