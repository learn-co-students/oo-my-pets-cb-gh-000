class Owner
  attr_accessor :name, :pets
  @@all = []

  def initialize(species='human')
    @species = species
    self.save
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }
  end

  def species
    @species.dup.freeze
  end

  # def self.create(name)
  #   owner = Owner.create(name)
  #   owner.save
  # end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.length
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood = 'happy' }
  end

  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood = 'happy' }
  end

  def feed_fish
    self.pets[:fishes].each { |fish| fish.mood = 'happy' }
  end

  def sell_pets
    self.pets.each do |species, pets|
      pets.each { |pet| pet.mood = 'nervous' }
    end
    self.pets.clear
  end

  def list_pets
    phrase = []
    self.pets.each do |species, pets|
      species_name = pets.first.class.to_s.downcase
      species_name += "(s)" unless species_name == "fish"
      phrase << "#{pets.length} #{species_name}"
    end
    phrase[-1] = "and #{phrase.last}"
    "I have #{phrase.join(', ')}."
  end

end
