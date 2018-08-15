class Cat
  # code goes here
  attr_accessor :mood
  attr_reader :name

  def initialize(name = "crookshanks")
    @name = name
    @mood = "nervous"
  end


end