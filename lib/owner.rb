require "pry"
class Owner
  attr_accessor :name
  attr_reader :species
  attr_accessor :pets
  @@all = []
  
  def initialize(name)
    @name = name
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }
    # @species = "human"
    @@all << self
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
  
  def species
    @species = "human"
  end
  
  def say_species
    return "I am a #{self.species}."
  end
  
  # def pets 
  #   return {
  #     :fishes => [],
  #     :dogs => [],
  #     :cats => []
  #   }
  # end
  
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
    @pets[:dogs].each{|dog| dog.mood = "happy"}
  end
  
  def play_with_cats
    @pets[:cats].each{|dog| dog.mood = "happy"}
  end
  
  def feed_fish
    @pets[:fishes].each{|dog| dog.mood = "happy"}
  end
  
  def sell_pets
    @pets.each{|key, value|
      value.each{|dog|
        dog.mood = "nervous"
      }
      value.clear
    }
  end
  
  def list_pets
    return "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end

owner = Owner.new("haha")
