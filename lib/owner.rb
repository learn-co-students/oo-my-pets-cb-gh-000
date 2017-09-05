class Owner
  # code goes here

	attr_reader :species
	attr_accessor :name, :pets

	@@all = []
	@@count = 0
	def initialize(species)
		@species = species
		@@all << self
		@@count += 1
		@pets = {fishes: [], dogs: [], cats: []}
	end

	def say_species
		"I am a #{@species}."
	end

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
		@pets[:dogs].each {|dog| dog.mood = "happy"}
	end

	def play_with_cats
		@pets[:cats].each {|cat| cat.mood = "happy"}
	end

	def feed_fish
		@pets[:fishes].each {|fish| fish.mood = "happy"}
	end

	def sell_pets
		@pets[:fishes].each {|fish| fish.mood = "nervous"}
		@pets[:cats].each {|cat| cat.mood = "nervous"}
		@pets[:dogs].each {|dog| dog.mood = "nervous"}
		@pets = {fishes: [], dogs: [], cats: []}
	end

	def list_pets
		"I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
	end

	def self.all
		@@all
	end

	def self.count
		@@count
	end

	def self.reset_all
		@@all.clear
		@@count = 0
	end
end
