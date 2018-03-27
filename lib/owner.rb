class Owner
  attr_reader :species
  attr_accessor :name, :pets
  # code goes here
  @@all = []

  def initialize(spec)
    @species = spec
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end
  def say_species
    "I am a #{@species}."
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

  def walk_dogs
    @pets[:dogs].collect {|x| x.mood = 'happy'}
  end

  def play_with_cats
    @pets[:cats].collect {|x| x.mood = 'happy'}
  end

  def feed_fish
    @pets[:fishes].collect {|x| x.mood = 'happy'}
  end

  def sell_pets
    @pets[:dogs].collect {|x| x.mood = 'nervous'}
    @pets[:cats].collect {|x| x.mood = 'nervous'}
    @pets[:fishes].collect {|x| x.mood = 'nervous'}
    @pets = {}
  end


  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
