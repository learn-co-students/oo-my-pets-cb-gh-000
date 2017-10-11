class Dog
  # code goes here

  attr_accessor :mood
  attr_reader :name

  def initialize(name)
    @name = name
    @mood = "nervous"
  end

end


# Dog can initialize a dog
# Dog initializes with a name
# Dog initializes with a nervous mood
# Dog can change its mood
