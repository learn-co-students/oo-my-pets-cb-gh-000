class Dog
  # code goes here
  attr_reader :name
  attr_accessor :mood

  # code goes here
  def initialize(name)
    @name = name
    @mood = "nervous"
  end
end
