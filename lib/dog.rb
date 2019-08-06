class Dog
  # code goes here
  @@all = []

  attr_reader :name
  attr_accessor :owner, :mood

  def initialize(name, owner)
    @name = name
    @owner = owner
    @owner.pets[:dogs] << self
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end
