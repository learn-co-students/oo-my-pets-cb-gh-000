class Fish
  # Method initializes the instance variables needed for the class to function.
  attr_accessor :mood
  attr_reader :name
  def initialize(name)
    @name = name
    @mood = "nervous"
  end
end
