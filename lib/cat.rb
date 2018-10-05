class Cat

  attr_reader :name
  attr_accessor :mood

  def initialize(name)
    @name = name
    @mood = "nervous"
  end

  def change_mood(mood)
    @mood = mood
  end

  def plays
    change_mood("happy")
  end

  def new_owner
    change_mood("nervous")
  end

end
