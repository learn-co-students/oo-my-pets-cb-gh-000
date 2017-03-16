class Fish
  attr_accessor :mood
  attr_reader :name

  def initialize(name)
    @mood = "nervous"
    @name = name
  end
end
