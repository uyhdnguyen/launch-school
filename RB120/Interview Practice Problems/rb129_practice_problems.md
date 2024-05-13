<!-- What is output? Is this what we would expect when using `AnimalClass#+`? 
If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return? -->

```ruby
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes
```
=begin
1. Point out module or class definitions.
2. Describe what is happening in the public interface.
3. EXPLICITLY answer the question.
4. Identify key principles.
5. Identify solutions.

=end

################################################################################

# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`? 

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name

=begin
1. Point out module or class definitions.

2. Describe what is happening in the public interface.

3. EXPLICITLY answer the question.

4. Identify key principles.

5. Identify solutions.

=end

################################################################################
# What does the code above output, and why? 
#What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?

class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels # 4

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels # 2
p Vehicle.wheels    # 2

class Car < Vehicle; end

p Vehicle.wheels # 2
p Motorcycle.wheels # 2
p Car.wheels # 2

=begin
1. Point out module or class definitions.

2. Describe what is happening in the public interface.

3. EXPLICITLY answer the question.

4. Identify key principles.

5. Identify solutions.

=end

################################################################################

# What is output and why?
# What does this demonstrate about `super`?

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno

=begin
1. Point out module or class definitions.

2. Describe what is happening in the public interface.

3. EXPLICITLY answer the question.

4. Identify key principles.

5. Identify solutions.

=end
################################################################################

- Instance variables are available through

################################################################################

# How does encapsulation relate to the public interface of a class?
# Encapsulation is the ability to protect specific code from being changed or manipulated without intention  by creating objects and exposing methods to interact with those objects

class Person
  # publicly available
  def initialize(name, password)
    @name = name
    @password = password
  end

  def confirm?(input)
    input == password
  end

  private
  # publicly inaccessible, but available throughout Object
  def password
    @password
  end
end

joe = Person.new("Joe", "1234")
attempt1 = "abcd"
attempt2 = "1234"

puts joe.confirm?(attempt1)
puts joe.confirm?(attempt2)

joe.password  # => Error

# 29.
# When does accidental method overriding occur, and why? Give an example.

# https://launchschool.com/books/oo_ruby/read/inheritance#accidentalmethodoverriding

# Accidental method overriding occurs when a custom method is defined with the same name as a method inherited from the Object Class, overriding it.
class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

class Inspector < Person
  attr_reader :job

  def initialize(name, job)
    super(name)
    @job = job
  end

  # def inspect # overrides Object#inspect
  #   puts "#{name} is inspecting #{job}."
  # end
end

cluseau = Inspector.new("Cluseau", "Panther Case")
puts cluseau.inspect

# 30.
# How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

class Person
  attr_accessor :name 
  
  def initialize(name, age)
    self.name = name
    self.age = age
  end

  def <(other)
    age < other.age
  end

  protected # protected methods are available within the same and other Instances of the same Class (or Subclasses)
  # private # private methods are only availbale within the same Instance
  
  attr_accessor :age
end

joe = Person.new("joe", 30)

henry = Person.new("henry", 40)

# puts joe.age
puts joe < henry

# 29.
# When does accidental method overriding occur, and why? Give an example.

# https://launchschool.com/books/oo_ruby/read/inheritance#accidentalmethodoverriding

# Accidental method overriding occurs when a custom method is defined with the same name as a method inherited from the Object Class, overriding it.
# class Person
#   attr_accessor :name

#   def initialize(name)
#     self.name = name
#   end
# end

# class Inspector < Person
#   attr_reader :job

#   def initialize(name, job)
#     super(name)
#     @job = job
#   end

#   # def inspect # overrides Object#inspect
#   #   puts "#{name} is inspecting #{job}."
#   # end
# end

# cluseau = Inspector.new("Cluseau", "Panther Case")
# puts cluseau.inspect


# 30.
# How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.

class Person
  attr_accessor :name 
  
  def initialize(name, age)
    self.name = name
    self.age = age
  end

  def <(other)
    age < other.age
  end

  protected # protected methods are available within the same and other Instances of the same Class (or Subclasses)
  # private # private methods are only availbale within the same Instance
  
  attr_accessor :age
end

joe = Person.new("joe", 30)

henry = Person.new("henry", 40)

# puts joe.age
puts joe < henry

# 31.
# Describe the distinction between modules and classes.

# 32.
# What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

module Moveable
  def crawl; end
  def walk; end
  def run; end
  def swim; end
  def roll
    puts "I rolled."
  end
end

class Adult < Person
  include Moveable

  def initialize(name, age)
    super(name, age)
    puts "I'm an #{self.class}."
  end
end

class Adolescent < Person
  include Moveable

  def initialize(name, age)
    super(name, age)
    puts "I'm an #{self.class}..."
  end
end

class Stone
  def roll
    puts "Rolling Stone!"
  end
end

class Log
  def roll
  puts "Rolling Log!"
  end
end

[Log.new, Stone.new, Adult.new("Bob", 50)].each(&:roll)

# 33.
# What is encapsulation, and why is it important in Ruby? Give an example.
# What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?

# Object Oriented Programming (OOP) is a programming paradigm created to deal with problems experienced by developers when creating large, complex programs. Which of the following statements are problems that led to the creation of OOP? Select all that apply.

# Large, complex programs can be difficult to maintain due to dependencies throughout the program. OOP lets programmers write programs in which the different parts of the program interact, thus reducing dependencies and facilitating maintenance.

# Coding in a non-OO way often means writing code that is useful solely within a single context. Defining basic classes and leveraging concepts like inheritance to introduce more detailed behaviors provides a greater level of reusability and flexibility.

# Complex coding problems are often difficult to break down and solve in a clear and systematic way. Using OOP to model classes appropriate to the problem, and using real-world nouns to represent objects, lets programmers think at a higher level of abstraction that helps them break down and solve problems.


=begin
Q : What are the benefits of using Object Oriented Programming in Ruby? 

Because there are so many benefits to using OOP we will just summarize some of the major ones:

  + Creating objects allows programmers to think more abstractly about the code they are writing.
  + Objects are represented by nouns so are easier to conceptualize.
  + It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
  + It allows us to easily give functionality to different parts of an application without duplication.
  + We can build applications faster as we can reuse pre-written code.
  + As the software becomes more complex this complexity can be more easily managed.

=end

# 36.
# What is the relationship between classes and objects in Ruby?
# Classes define the behavior and possible attributes available to an Object of that Type.


# 37.
# When should we use class inheritance vs. interface inheritance?

#38.
# class Cat
#   def ==(other_cat)
#     other_cat.is_a?(Cat)
#   end
# end

# p whiskers = Cat.new
# p ginger = Cat.new
# p paws = Cat.new

# p paws == whiskers
# p paws.equal?(whiskers)
# p paws.object_id == whiskers.object_id

# If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?
# without overriding, `#==` compares Object Equivalence in the same way as `#equal?`.

#39.
# class Thing
# end

# class AnotherThing < Thing
# end

# class SomethingElse < AnotherThing
# end

# Describe the inheritance structure in the code above, and identify all the superclasses.

# 40.

module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
# pingu.fly

p Penguin.ancestors
# What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.
# [Penguin, Migratory, Aquatic, Bird, Animal, Object, Kernel, BaicObject]

# 41
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end
