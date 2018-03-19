class Owner
  # code goes here
	@@all_owner = []

	attr_accessor :pets, :name
	attr_reader :species
	attr_writer :name

	def initialize(name)
	@name = name
	@pets = {fishes: [], cats: [], dogs: []}
	@species = "human"
	@@all_owner << self
	end

	def self.all
		@@all_owner
	end

	def self.count
		@@all_owner.size
	end

	def self.reset_all
		@@all_owner = []
	end

	def say_species
		"I am a human."
	end

	def buy_fish(name)
	new_fish = Fish.new(name)
	@pets[:fishes] << new_fish
	end

	def buy_cat(name)
	new_cat = Cat.new(name)
	@pets[:cats] << new_cat
	end

	def buy_dog(name)
	new_dog = Dog.new(name)
	@pets[:dogs] << new_dog
	end

	def walk_dogs
		@pets[:dogs][0].mood = "happy"
	end

	def play_with_cats
		@pets[:cats][0].mood = "happy"
	end

	def feed_fish
		@pets[:fishes][0].mood = "happy"
	end

	def sell_pets
		@pets.each do |type, pets|
			pets.each{|pet| pet.mood = "nervous"}
			@pets[:"#{type}"] = []
		end
	end

	def list_pets
		"I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
	end

end
