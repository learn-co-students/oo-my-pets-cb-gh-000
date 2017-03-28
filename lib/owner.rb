class Owner
  # code goes here
  @@all = []

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  attr_accessor :name,:pets

  def initialize name
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
    save
  end

  def species
    "human"
  end

  def say_species
    "I am a human."
  end

  def buy_fish name
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat name
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog name
    self.pets[:dogs] << Dog.new(name)
  end

  def list_pets
      "I have #{pets[:fishes].size} fish, #{pets[:dogs].size} dog(s), and #{pets[:cats].size} cat(s)."
  end

  def play_with_cats
    animals_happy_mood :cats
  end

  def feed_fish
    animals_happy_mood :fishes
  end

  def walk_dogs
    animals_happy_mood :dogs
  end

  def sell_pets
    animals_nervous_mood
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

  private

  def animals_happy_mood animals = nil
    change_mood animals, "happy"
  end

  def animals_nervous_mood animals = nil
    change_mood animals, "nervous"
  end

  def change_mood animals, value
    unless animals
      [:cats,:dogs,:fishes].each do |species|
        self.pets[species].map{|animal| animal.mood = value}
      end
    else
      self.pets[animals].map{|animal| animal.mood = value}
    end
  end

  def save
    @@all << self
  end
end
