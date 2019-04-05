class Dog
    # code goes here

    attr_reader :name
    attr_accessor :mood, :owner

    @@all = []

    def initialize(name, owner)
        @name = name
        @mood = "nervous"
        @owner = owner
        @@all << self
    end

    def self.all
        @@all
    end

end