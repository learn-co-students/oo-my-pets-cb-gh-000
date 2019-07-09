require_relative 'spec_helper.rb'

describe "Associations" do
  before do
    @owner = Owner.new("Timmy")
  end

  after do
    Owner.all.clear
    @owner.cats.clear
    @owner.dogs.clear
  end
  context "Owner" do
    describe "#cats" do
      it "initializes with a cats array" do
        expect(@owner.cats).to be_a(Array)
      end
    end

    describe "#dogs" do
      it "initializes with a dogs array" do
        expect(@owner.dogs).to be_a(Array)
      end
    end
  end

  context "Cat" do
    describe "#initialize" do
      it "it adds the cat to the Owner's collection of cats" do
        cat = Cat.new("Garfield", @owner)
        expect(@owner.cats).to include(cat)
      end
    end
  end

  context "Dog" do
    describe "#initialize" do
      it "it adds the dog to the Owner's collection of dogs" do
        dog = Dog.new("Daisy", @owner)
        expect(@owner.dogs).to include(dog)
      end
    end
  end

  context 'Owner instance methods' do
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
        expect(@owner.cats.count).to eq(0)
        expect(@owner.dogs.count).to eq(0)
      end
    end

    describe "#list_pets" do
      it 'can list off its pets' do
        @owner.buy_cat("Crookshanks")
        @owner.buy_dog("Fido")
        @owner.buy_dog("Snuffles")
        @owner.buy_dog("Charley")
        expect(@owner.list_pets).to eq("I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s).")
      end
    end
  end
end
