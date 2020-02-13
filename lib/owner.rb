class Owner
  attr_reader :name , :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end
  def self.count
    @@all.size
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end


  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy" if dog.owner == self
    end
  end
  def feed_cats
    Cat.all.each do |cat|
        cat.mood = "happy" if cat.owner == self
      end
  end

  def sell_pets
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end

    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end
  def buy_cat(cat_name)
    cat = Cat.find_or_create_a_cat(cat_name,self )
  end

  def buy_dog (dog_name)
    dog = Dog.find_or_create_a_dog(dog_name,self)
  end


end
