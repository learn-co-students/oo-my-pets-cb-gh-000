require_relative 'spec_helper.rb'

describe Dog do

  let(:timmy) {Owner.new("Timmy")}
  let(:dog) { Dog.new("Lassie", timmy) }

  it "can initialize a dog" do
    expect(dog).to be_a(Dog)
  end

  it "initializes with a name" do
    expect(dog.name).to eq("Lassie")
  end

  it "can't change its name" do
    expect { dog.name = "Fido" }.to raise_error NoMethodError
  end

  it "initializes with a nervous mood" do
    expect(dog.mood).to eq("nervous")
  end

  it "can change its mood" do
    dog.mood = "hungry"
    expect(dog.mood).to eq("hungry")
  end

end
