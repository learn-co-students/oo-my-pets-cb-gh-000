class Dog
  attr_accessor :owner ,  :mood
  attr_reader :name
  @@all =[]
  def initialize(name , owner )
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
  def self.count
    @@all.size
  end

  def self.find_or_create_a_dog(name , owner  )
    # dog = @@all.find {|c| c.name == name  }
    # dog.owner = owner if dog
    self.new(name , owner )
  end
end
