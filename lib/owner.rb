class Owner
  attr_reader :name,:species
  @@owner=[]
  def self.owner
    @@owner
  end
  def initialize(name)
    @name=name
    @species="human"
    self.class.owner << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    self.owner
  end

  def self.count
    self.owner.length
  end

  def self.reset_all
    @@owner=[]
  end
end
