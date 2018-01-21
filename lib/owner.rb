class Owner
  
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []
  
  def initialize(species)
    @species = species
    self.class.all << self
    @pets = {fishes: [], cats: [], dogs: []}
  end
  
  def self.all 
    @@all 
  end
  
  def self.count
    self.all.length
  end
  
  def self.reset_all
    self.all.clear
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def buy_fish(fish_name)
    fish = Fish.new(fish_name)
    @pets.each { |k,v| v << fish if k == :fishes }
  end
  
  def buy_cat(cat_name)
    cat = Cat.new(cat_name)
    @pets.each { |k,v| v << cat if k == :cats }
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name)
    @pets.each { |k,v| v << dog if k == :dogs }
  end
  
  def walk_dogs
    @pets.each { |k,v| v.each{|x| x.mood = "happy"} if k == :dogs }
  end 
  
  def play_with_cats
    @pets.each { |k,v| v.each{|x| x.mood = "happy"} if k == :cats }
  end 
  
  def feed_fish
    @pets.each { |k,v| v.each{|x| x.mood = "happy"} if k == :fishes }
  end
  
  def sell_pets
    @pets.each { |k,v| 
      v.each{|x| x.mood = "nervous"
      
      }
      v.clear
    }
  end
  
  def list_pets 
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
  
end



# learn spec/owner_spec.rb --fail-fast

# ruby lib/owner.rb
















