require_relative 'spec_helper.rb'

describe Owner do
  before(:each) do
    Owner.reset_all
  end

  let(:owner) { Owner.new("human") }
  let(:fish) { Fish.new("Nemo") }
  let(:cat) { Cat.new("Crookshanks") }
  let(:dog) { Dog.new("Fido") }  

  describe 'Class methods' do
    it "keeps track of the owners that have been created" do
      expect(Owner.all).to include(owner)
    end

    it "can count how many owners have been created" do
      Owner.new("human")
      expect(Owner.count).to eq(1)
    end

    it "can reset the owners that have been created" do
      Owner.reset_all
      expect(Owner.count).to eq(0)
    end
  end 

  it "initializes with a species" do
    expect(owner.species).to eq("human")
  end

  it "can't change its species" do 
    expect { owner.species = "hamster" }.to raise_error
  end

  it "can say its species" do 
    expect(owner.say_species).to eq("I am a human.")
  end 

  it "can have a name" do
    owner.name = "Katie"
    expect(owner.name).to eq("Katie")
  end

  it "is initialized with a pets attribute as a hash" do
    expect(owner.pets).to eq({:fishes => [], :dogs => [], :cats => []})
  end

  it 'can buy a fish' do 
    expect(owner.pets[:fishes].count).to eq(0)
    owner.buy_fish("Bubbles")
    expect(owner.pets[:fishes].count).to eq(1)
  end

  it 'can buy a cat' do 
    expect(owner.pets[:cats].count).to eq(0)
    owner.buy_cat("Crookshanks")
    expect(owner.pets[:cats].count).to eq(1)
  end

  it 'can buy a dog' do
    expect(owner.pets[:dogs].count).to eq(0)
    owner.buy_dog("Snuffles")
    expect(owner.pets[:dogs].count).to eq(1)
  end

  it 'knows about its fishes' do
    expect(owner.pets[:fishes]).to include(fish)
  end

  it 'knows about its cats' do 
    expect(owner.pets[:cats]).to include(cat)
  end

  it 'knows about its dogs' do
    expect(owner.pets[:dogs]).to include(dog) 
  end

  xit "walks the dogs which makes the dogs' moods happy" do
  end 

  xit "plays with the cats which makes the cats moods happy" do
  end 

  xit "feeds the fishes which makes the fishes' moods happy" do
  end 

  xit 'can sell all its pets' do 
  end

end