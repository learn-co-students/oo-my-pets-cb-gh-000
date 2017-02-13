class Fish

  attr_accessor :mood
  attr_reader :name

  def initialize(name)
    @name = name
    @mood ="nervous"
  end

  def change_mood(mood)
    @mood = mood
  end

  def eats
    change_mood("happy")
  end

  def new_owner
    change_mood("nervous")
  end

end
