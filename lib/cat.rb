class Cat

  attr_reader :name, :owner, :mood
  @@all = []

  def initialize(name, owner)
    @@all << self
    @name = name
    @owner = owner
    @owner.cats << self
    @mood = "nervous"
  end

  def mood=(mood)
    @mood = mood
  end

  def owner=(owner)
    @owner = owner
  end

  def self.all
    @@all
  end
end
