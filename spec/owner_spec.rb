require 'pry'
require_relative 'spec_helper.rb'

describe Owner do

  before do
    @owner = Owner.new("Victoria")
  end

  after do 
    Owner.all.clear
    Cat.all.clear
    Dog.all.clear
  end

  context 'Class methods' do

    it "::all returns all instances of Owner that have been created" do
      expect(Owner.all).to include(@owner)
    end

    it "::count returns the number of owners that have been created" do
      expect(Owner.count).to eq(1)
      Owner.new("Melanie")
      Owner.new("Ginger")
      expect(Owner.count).to eq(3)
    end

    it "::reset_all can reset the owners that have been created" do
      Owner.reset_all
      expect(Owner.count).to eq(0)
    end

  end

  context 'Instance methods' do

    describe "#species" do
      it "initializes with a species" do
        expect(@owner.species).to eq("human")
      end

      it "can't change its species" do
        expect { @owner.species = "hamster" }.to raise_error NoMethodError
      end
    end

    describe "#say_species " do
      it "can say its species" do
        expect(@owner.say_species).to eq("I am a human.")
      end
    end

    describe "#name" do
      it "can have a name" do
        expect(@owner.name).to eq("Victoria")
      end

      it "cannot change owner's name" do
        expect { @owner.name = "Beckham" }.to raise_error NoMethodError
      end
    end

    describe "#buy_cat" do
      it 'can buy a cat that is an instance of the Cat class' do
        expect(@owner.cats.count).to eq(0)
        @owner.buy_cat("Crookshanks")
        @owner.cats.each do |cat|
          expect(cat).to be_a(Cat)
        end
        expect(@owner.cats.count).to eq(1)
      end

      it 'knows about its cats' do
        @owner.buy_cat("Crookshanks")
        expect(@owner.cats[0].name).to eq("Crookshanks")
      end

    end

    describe "#buy_dog" do
      it 'can buy a dog that is an instance of the Dog class' do
        expect(@owner.dogs.count).to eq(0)
        @owner.buy_dog("Snuffles")
        @owner.dogs.each do |dog|
          expect(dog).to be_a(Dog)
        end
        expect(@owner.dogs.count).to eq(1)
      end


      it 'knows about its dogs' do
        @owner.buy_dog("Snuffles")
        expect(@owner.dogs[0].name).to eq("Snuffles")
      end
    end

    describe "#walk_dogs" do
      it "walks the dogs which makes the dogs' moods happy" do
        dog = Dog.new("Daisy", @owner)
        @owner.walk_dogs
        expect(dog.mood).to eq("happy")
      end
    end

    describe "#feed_cats" do
      it "feeds cats which makes the cats' moods happy" do
        cat = Cat.new("Muffin", @owner)
        @owner.feed_cats
        expect(cat.mood).to eq("happy")
      end
    end


    describe "#sell_pets" do
      it 'can sell all its pets, which makes them nervous' do
        fido = Dog.new("Fido", @owner)
        tabby = Cat.new("Tabby", @owner)
        [fido, tabby].each {|o| o.mood = "happy" }
        @owner.sell_pets
        [fido, tabby].each { |o| expect(o.mood).to eq("nervous") }
      end

      it 'can sell all its pets, which leaves them without an owner' do
        fido = Dog.new("Fido", @owner)
        tabby = Cat.new("Tabby", @owner)
        [fido, tabby].each {|o| o.mood = "happy" }
        @owner.sell_pets
        [fido, tabby].each { |o| expect(o.owner).to be(nil) }
      end
    end

    describe "#list_pets" do
      it 'can list off its pets' do
        @owner.buy_cat("Crookshanks")
        @owner.buy_dog("Fido")
        @owner.buy_dog("Snuffles")
        @owner.buy_dog("Charley")
        expect(@owner.list_pets).to eq("I have 3 dog(s), and 1 cat(s).")
      end
    end
  end
end
