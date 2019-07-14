class Dog
  # code goes here
  @@all = []

  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(name, owner)
    @name = name
    @mood = "nervous"
    self.add_owner(owner)

    @@all << self
  end

  def self.all
    @@all
  end

  def add_owner(owner)
    if self.owner != owner
      self.owner = owner
      owner.add_dog(self)
    end
  end

  def remove_owner
    self.owner = nil
  end
end
