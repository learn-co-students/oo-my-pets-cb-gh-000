class Cat
  # code goes here
  attr_accessor :mood
  attr_reader :name
  def initialize(name, mood = "nervous")
    @name = name
    self.mood = mood
  end
end
