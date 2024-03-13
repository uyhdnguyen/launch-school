class Cat
  @@number_of_cats = 0

  def initialize
    @@number_of_cats += 1
  end

  def self.total
    puts @@number_of_cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

# Sometimes, certain data needs to be handled by the class itself, instead of instances of the class. That's where class variables come in. Class variables can be differentiated from instance variables by the double @@ prepended to their name.

# In the solution, we use a class variable named number_of_cats to track the number of Cat instances. We're able to track this by incrementing @@number_of_cats each time a new object is instantiated. For each instance, #initialize will be invoked, which will in turn execute our statement that increments @@number_of_cats.

# We can print the total number of Cat instances simply by invoking #puts on @@number_of_cats.