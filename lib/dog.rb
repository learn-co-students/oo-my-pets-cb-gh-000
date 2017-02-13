class Dog

  attr_accessor :mood
  attr_reader :name

  def initialize(name)
    @name = name
    @mood = "nervous"
  end

  def change_mood(mood)
    @mood = mood
  end

  def new_owner
    change_mood("nervous")
  end

  def walks
    change_mood("happy")
  end
end
