class Cat
  # code goes here

  attr_accessor :mood
  attr_reader :name

  def initialize(name)
    @name = name
    @mood = "nervous"
  end

end


# Cat initializes with a name
# Cat initializes with a nervous mood
# Cat can't change its name
# Cat can change its mood  
