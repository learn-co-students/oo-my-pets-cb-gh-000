require_relative 'spec_helper.rb'

describe Owner do
  before(:each) do
    Owner.reset_all
  end

  let(:owner) { Owner.new("human") }
  let(:fish) { Fish.new("human") }
  let(:cat) { Cat.new("human") }
  let(:dog) { Dog.new("human") }  

  it "can initialize an owner" do
    expect(owner).to be_a(Owner)
  end

  it "initializes with a species" do
    expect(owner.species).to eq("human")
  end

  it "can't change its species" do 
    expect(owner.species = "hamster").to raise_error
  end

  it "can have a name" do
    owner.name = "Katie"
    expect(owner.name).to eq("Katie")
  end

  it "is initialized with a pets attribute as a hash" do
    expect(owner.pets).to eq({:fishes => [], :dogs =>, :cats => []})
  end

  it 'can buy a fish' do 
    expect(owner.)
  end

  it 'can buy a cat' do 
  end

  it 'can buy a dog' do 
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

  it "keeps track of the owners that have been created" do
    expect(Owner.all).to include(owner)
  end

  it "can count how many owners have been created" do
    Owner.new
    expect(Owner.count).to eq(1)
  end

  it "can reset the owners that have been created" do
    Owner.reset_all
    expect(Owner.count).to eq(0)
  end