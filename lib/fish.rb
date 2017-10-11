class Fish
  # code goes here

  attr_accessor :mood
  attr_reader :name

  def initialize(name)
    @name = name
    @mood = "nervous"
  end

end


# Fish can initialize a fish
# Fish initializes with a name
# Fish initializes with a nervous mood
# Fish can change its mood
