class Owner
attr_accessor :pets , :name
@@all = []
  def initialize(name)
   @pets = {fishes: [], cats: [], dogs: []}
   @name
   @@all << self
   @species = "human"
  end
  def buy_cat(cat_name)
@pets[:cats] << Cat.new(cat_name)
  end
  def buy_dog(dog_name)
    @pets[:dogs] << Dog.new(dog_name)
  end
  def buy_fish(fish_name)
    @pets[:fishes] << Fish.new(fish_name)
  end
  def self.all
    @@all
  end
  def self.reset_all
    @@all.clear
  end
  def species
    @species
  end
  def say_species
    "I am a human."
  end
  def self.count
    @@all.count
  end
  def walk_dogs
  @pets[:dogs].each{|dog| dog.mood = "happy"}
  end
  def play_with_cats
    @pets[:cats].each{|c| c.mood = "happy"}
  end
  def feed_fish
  @pets[:fishes].each{|f|f.mood = "happy"}
  end
  def sell_pets
    @pets.each{|k,v| v.each{|p| p.mood = "nervous"}}
    @pets.each{|k,v|v.clear}
  end
  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
end
