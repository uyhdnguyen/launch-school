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

