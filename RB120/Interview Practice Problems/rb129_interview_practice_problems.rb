# Problem by Natalie Thompson
class Person
  def initialize(name, job)
      @name = name
  end 
end

roger = Person.new("Roger", "Carpenter")
puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method. 


#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"
#--------------------------------------------
class Person
  def initialize(name, job)
      @name = name
      @job = job
  end
  
  def to_s
    "My name is #{@name} and I am a #{@job}"
  end

end

roger = Person.new("Roger", "Carpenter")
puts roger

################################################################################
# Problem received from Raul Romero
class Human 
  attr_reader :name
  
  def initialize(name="Dylan")
    @name = name
  end
  
end

puts Human.new("Jo").hair_colour("blonde")  
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")              
# Should "Hi, my name is Dylan and I have blonde hair."
#----------------------------------------------------------

class Human 
  attr_reader :name
  
  def initialize(name="Dylan", color = "blonde")
    @name = name
    @color = color
  end
  
  def hair_colour(color = "blonde")
    "Hi, my name is #{name} and I have #{color} hair."
  end
  
  def self.hair_colour(name = "Dylan", color = "blonde")
    name == "" ? name = "Dylan" : name
    "Hi, my name is #{name} and I have #{color} hair."
  end
end
################################################################################
# Problem received from Raul Romero
class Human
  attr_reader :name 
  
  def initialize(name)
  end
 
end

gilles = Human.new("gilles") 
anna = Human.new("gilles") 

puts anna.equal?(gilles) #should output true # 
puts anna + gilles # should output annagilles 
#----------------------------------------------------------

class Human
  attr_reader :name 
  
  def initialize(name)
    @name = name
  end
  
  def equal?(other)
    self.name == other.name
  end
  
  def +(other)
    self.name + other.name
  end
end
################################################################################
#describe what the code below outputs and why from Joseph Ochoa
module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters 
  
  def initialize(name) 
    self.name # @name is initialized but it's not referencing anything. Hence, @name is nil
    @characters = [] 
  end
  
  def display
    name
  end
  
  protected 
  attr_reader :name
  attr_writer :name
end

class Monster < Characters
  include Attackable
  
  def initialize(name)
    super
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self) # 
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb') 
rob = Monster.new('monst')
conan.characters << rob
p conan.display # `display` method return @name which is `nil`
################################################################################
# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
# If you used class inheritance, now try doing it without class inheritance directly.
# If you used modules, now try not using modules
# If you used duck typing, now don't use duck typing 

class Monster
  def attack
    "attacks!"
  end
end

class Barbarian
  
end
#----------------------------------------------------------

class Monster
  def attack
    "attacks!"
  end
end

class Barbarian
  def initialize
    @type = Monster.new.attack
  end
  
  def to_s
    @type
  end
end

puts Barbarian.new
################################################################################
# Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes
class ClassA 
  attr_reader :field1, :field2
  
  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
end

class ClassB 
  attr_reader :field1
  
  def initialize
    @field1 = "abc"
  end
end


obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new


p obj1 > obj2
p obj2 > obj3
#----------------------------------------------------------

class ClassA 
  include Comparable
  attr_reader :field1, :field2
  
  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
  
  def <=>(other)
    return nil unless other.is_a?(ClassA)
    @field1 <=> other.field1 && @field2 <=> other.field2
  end
end

class ClassB < ClassA
  attr_reader :field1
  
  def initialize
    super(@field2 = 0)
    @field1 = "abc"
  end
end
#----------------------------------------------------------
################################################################################
# Originally by Natalie Thompson, this version by James Wilson
class Wizard
  attr_reader :name, :hitpoints
  
  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end  
  
  def fireball
    "casts Fireball for 500 damage!"
  end
  
end

class Summoner < Wizard
  attr_reader :souls
  
  def initialize(name, hitpoints)
    super(name, hitpoints) # only add one line here
    @souls = []
  end
  
  def soul_steal(character)
    @souls << character
  end
end

gandolf = Summoner.new("Gandolf", 100)
p gandolf.name # => "Gandolf"

valdimar = Wizard.new("Valdimar", 200)
p valdimar.fireball #=> "casts fireball for 500 damage!"

p gandolf.hitpoints #=> 100

p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]
p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"

################################################################################

# Problem by Natalie Thompson
class Person
  def initialize(name, job)
      @name = name
      @job =job
  end

  def to_s
    "My name is #{@name} and I am a #{@job}"
  end
end

roger = Person.new("Roger", "Carpenter")
puts roger
puts
# Add 1 line of code for the person class
# and 1 line of code in the initalize method. 


#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"

# ================================================================

# Problem received from Raul Romero
class Human
  attr_reader :name

  def initialize(name = "Dylan")
    @name = name
  end

  def hair_colour(color)
    "Hi, my name is #{name} and I have #{color} hair."
  end

  def self.hair_colour(color, name = "Dylan")
    color = "blonde" if color.empty?
    "Hi, my name is #{name} and I have #{color} hair."
  end
end

puts Human.new("Jo").hair_colour("blonde")
# Output: "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")
# Output: "Hi, my name is Dylan and I have blonde hair."

puts
# ================================================================

class Human  # Problem received from Raul Romero
  attr_reader :name 
  
  def initialize(name)
    @name = name
  end
 
  def equal?(other_human)
    name == other_human.name
  end

  def +(other_human)
    "anna" + other_human.name
  end
end

gilles = Human.new("gilles") 
anna = Human.new("gilles") 

puts anna.equal?(gilles) #should output true
puts anna + gilles # should output annagilles 
puts

# ================================================================

#describe what the code below outputs and why from Joseph Ochoa

module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters 
  
  def initialize(name) 
    # setter method `name` is called but didn't get assigned to anything
    self.name 
    @characters = []
  end
  
  def display
    name # name is always `nil` since @name has never been initialized
  end
  
  protected # both setter and getter methods are changed back to protected methods
  attr_reader :name
  attr_writer :name
end

class Monster < Characters
  include Attackable
  
  def initialize(name)
    super # super here called self.name & @characters = []
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self) # 
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb')
barbarian = Barbarian.new("test")
rob = Monster.new('monst')
conan.characters << rob
p conan.display
# p conan == barbarian # Raise an error
puts

# ================================================================

# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 

# class Monster
#   def attack
#     "attacks!"
#   end
# end

# class Barbarian < Monster
  
# end

# module Attackable
#   def attack
#     "attacks!"
#   end
# end

# class Monster
#   include Attackable 
# end

# class Barbarian < Monster
#   include Attackable 
# end

# ================================================================

# Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes
# class ClassA
  
#   attr_reader :field1, :field2
  
#   def initialize(num)
#     @field1 = "xyz"
#     @field2 = num
#   end

#   def >(other_obj)
#     field1 > other_obj.field1
#   end
# end

# class ClassB 
#   attr_reader :field1

#   def initialize
#     @field1 = "abc"
#   end
# end

# obj1 = ClassA.new(50)
# obj2 = ClassA.new(25)
# obj3 = ClassB.new

# p obj1 > obj2
# p obj2 > obj3

# ======================================================================
# Unknown
class BenjaminButton 
  attr_accessor :actual_age, :appearance_age

  def initialize
    self.actual_age = 0
    self.appearance_age = 100
  end
  
  def get_older
    self.actual_age += 1
    self.appearance_age -= 1
  end
  
  def look_younger
  end
  
  def die
    self.actual_age = 100
    self.appearance_age = 0
  end
end

class BenjaminButton
end


benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1
p benjamin.actual_age

benjamin.get_older
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0
puts

#=====================================================================

# Originally by Natalie Thompson, this version by James Wilson
class Wizard
  attr_reader :name, :hitpoints
  
  def initialize(name, hitpoints)
    @name = name
    @hitpoints = hitpoints
  end  
  
  def fireball
    "casts Fireball for 500 damage!"
  end
  
end

class Summoner < Wizard
  attr_reader :souls
  
  def initialize(name, hitpoints)
    # only add one line here
    super(name, hitpoints)
    @souls = []
  end
  
  def soul_steal(character)
    @souls << character
  end
end

gandolf = Summoner.new("Gandolf", 100)
p gandolf.name # => "Gandolf"

valdimar = Wizard.new("Valdimar", 200)
p valdimar.fireball #=> "casts fireball for 500 damage!"

p gandolf.hitpoints #=> 100

p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"
puts

# ====================================================================

# LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
    "I am #{@name}, I am a superhero, and I can fly!"
  end
end

class Superhero 
  include Flightable

  attr_accessor :ability
  
  def self.fight_crime
    puts "I am #{self}!"
    puts "I fight crime with my coding skills ability!"
  end
  
  def initialize(name)
    @name = name
  end
  
  def announce_ability
    puts "I fight crime with my #{ability.description} ability!"
  end
end

class LSMan < Superhero
  def initalize(name)
    super
    @ability = Ability.new("coding skills")
  end
end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!


class Pet
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end

  def zazu
    self.class.new(name)
  end

  def self.greeting
    self.new().greeting
  end
end


class Bird < Pet
  SCIENTIFIC_NAME = 'Aves'
  attr_accessor :name, :age, :color
  
  def initialize(name = nil, age = nil, color = nil)
    super()
    self.name = name
    self.age = age
    self.color = color
  end

  def introduce
    "I'm #{zazu.name}. #{zazu.class.greeting}!"
  end
  
  def greeting
    "Chirp"
  end
end

class Parrot < Bird
  SCIENTIFIC_NAME = 'Psittaciformes'
  def greeting
    "Squawk"
  end
end

zazu = Parrot.new('Zazu', 2, 'Red')
zippy = Bird.new('Zippy', 5, 'Green')

puts zazu.introduce # I'm Zazu. Squawk!
puts zippy.introduce # I'm Zippy. Chirp!∑
