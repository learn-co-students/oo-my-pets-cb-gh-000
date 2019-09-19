class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  # Instance methods
  def initialize name, owner
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  # Class methods
  def self.all
    @@all
  end

  #my methods
  def self.find_cat_by_name name
    self.all.detect {|cat| cat.name == name }
  end
end
