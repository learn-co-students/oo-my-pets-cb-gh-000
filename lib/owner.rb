class Owner
  # code goes here
  attr_accessor :name, :pets
  @@all = []
  def initialize(species)
    @species=species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end
  def species
    @species
  end
  def say_species
    "I am a #{@species}."
  end
  def self.count
    @@all.size
  end
  def self.all
    @@all
  end
  def self.reset_all
    @@all=[]
  end

  def buy_fish(pet_name)
    fish = Fish.new(pet_name)
    @pets[:fishes] << fish
  end
  def buy_cat(pet_name)
    cat = Cat.new(pet_name)
    @pets[:cats] << cat
  end
  def buy_dog(pet_name)
    dog = Dog.new(pet_name)
    @pets[:dogs] << dog
  end

  def feed_fish
    @pets[:fishes].map {|fish| fish.mood="happy"}
  end
  def play_with_cats
    @pets[:cats].map {|cat| cat.mood="happy"}
  end
  def walk_dogs
    @pets[:dogs].map {|dog| dog.mood="happy"}
  end

  def sell_pets
    @pets.each_pair do |pet_type, pets|
      @pets[pet_type] = []
      pets.map do |pet|
        pet.mood="nervous"
      end
    end
  end
  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
end
