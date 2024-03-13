class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty

# The key for this exercise is that every class has a #to_s method. puts calls #to_s method for every argument it gets passed to convert the value to an appropriate string representation. Knowing this, we can override #to_s for any class to produce any useful output we need.

# Here, we define #to_s to return I'm Sophie!, so puts kitty prints I'm Sophie!.