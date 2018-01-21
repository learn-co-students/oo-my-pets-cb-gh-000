class Dog
  
  attr_accessor :mood
  attr_reader :name
  
  def initialize(name)
    @name = name
    @mood = "nervous"
  end
  
end



# learn spec/dog_spec.rb --fail-fast