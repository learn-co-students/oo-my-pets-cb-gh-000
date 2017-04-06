class Dog
  attr_accessor :mood

  def initialize(name, mood='nervous')
    @name = name
    @mood = mood
  end

  def name
    @name.dup.freeze
  end
end
