class Puppy
  attr_accessor :name, :age, :breed
  @@all = []

  def initialize(name, breed, age)
    @name = name
    @age = age
    @breed = breed
    self.class.all << self
  end

  def self.all
    @@all
  end

end
