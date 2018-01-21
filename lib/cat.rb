class Cat
  
  attr_accessor :mood
  attr_reader :name
  
  def initialize(name, mood= "nervous")
    @name = name
    @mood = mood
  end
  
  
  
end



# learn spec/cat_spec.rb --fail-fast