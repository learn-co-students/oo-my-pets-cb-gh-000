class Dog
  # Method initializes the instance variables needed for the class to function.
  attr_accessor :mood
  attr_reader :name
  def initialize(name, mood = "nervous")
    @name = name
    @mood = mood
  end
end
