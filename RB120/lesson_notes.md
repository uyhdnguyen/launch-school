## Encapsulation
- Encapsulation is the ability to protect specific code from being changed or manipulated without intention  by creating objects and exposing methods to interact with those objects
	- This is done by using method access control like private, protected
	-  Creating class and module
```ruby
class GuestUser
	def initialize(default_password = "abcd")
		@default_password = default_password
	end

	private
		attr_writer :default_password
end
```
## Polymorphism
- Polymorphism is the way to design data types in such a way that you can treat different types of data as if they are a single type. This enables them to respond to the same method invocation
#### Class inheritance
- Class inheritance occurs when all subclasses of a parent-class share a common behavior which can be defined in parent-class, allowing each subclass to inherit  it
	-  A class inherits the behaviors of another class (This is called superclass)
	- Can only subclass from one class
	- Ruby allows single inheritance
	- Use when there is a `is-a` relationship
		- the dog `is-an` animal
	- `super`  is used to call methods earlier in the method lookup path that has the same name, then invokes it
		- `super` is commonly used in `initialize` method
			- It forwards `color` argument (which reference `brown`), when `super` keyword is called, to the `initialize` method in `GoodDog
		- if method in superclass has no argument, need to call `super()` with empty parenthesis in subclass

```ruby
class Human
	def sleep
		"I'm sleeping"
	end
end

class Adult < Human; end
class Child < Human; end

[Adult.new, Child.new].each(&:sleep)
```

```ruby
# Does not specify arguments to pass in `super`
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

bruno = GoodDog.new("brown") # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```

```ruby
# Specify which arguments get passed in `super`
class BadDog < Animal
	def initialize(age, name)
		super(name)
		@age = age
	end
end

BadDog.new(2, "bear") # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```

```ruby
# Explicitly states that no arguments are passed into superclass
class Animal
	def initialize
	end
end

class Bear < Animal
	def initialize(color)
		super()
		@color = color
	end
end

bear = Bear.new("black") # => #<Bear:0x007fb40b1e6718 @color="black">
```

##### Interface inheritance
- Interface Inheritance occurs when multiple, but not all, subclasses of a parent-class share a common behavior which can be extracted to a module and included into the necessary classes as a mixin 
	- Can mix in as many modules as needed
	- Cannot create objects from modules
	- Use when there is a `has-a` relationship
		- The dog `has-an` ability to swim

```ruby
module Swimmable
	def swim
		puts "I'm swimming"
	end
end

class Human; end

class Adult < Human
	include Swimmable
end

class Child < Human
	include Swimmable
end

class Baby < Human; end

[Adult.new, Child.new, Baby.new].each(&:swim)
```
##### Duck typing
- Duck typing occurs when unrelated objects from different classes share a common behavior and can be grouped together with intention
	- All involved objects use the same method name and take same number of arguments
	- Polymorphic methods are  intentionally designed to be polymorphic

```ruby
# Duck Typing Example
class Freezer
	def routine_check
		puts "Checking Freezer"
	end
end

class Stove
	def routine_check
		puts "Checking Stove"
	end
end

[Freezer.new, Stove.new].each(&:routine_check)
```

```ruby
# Not a Duck Typing example
class Freezer
	def routine_check
		puts "Checking Freezer"
	end
end

class Waiter
	def routine_check
		puts "Checking on Customers"
	end
end
```

---
# Basic OOP
- Classes  group common behaviors
- Objects encapsulate states
- Object's state is saved in object's instance variables
- Object state usually is a string or number
- Instance methods  operate on instance variables
### Objects 
- Objects are created from classes
- Each object from same class contains different information (states)
- Instance variables are used to keep track of states of objects
- Instance methods are used to expose behaviors of classes for objects
- Creating a new object/ instance from a class is called **instantiation**
	- `sunny = GoodDog.new`
## Instance Variables
- Instance variable has `@` in front of it
	- `@name`
- Instance variables are used to keep track states of objects
- Instance variables are available as long as the objects are not destroyed

```ruby
class Dog
	def initialize(n)
		@name = n
	end
end

sunny = Dog.new("Sunny")
```

```markdown
Local variabale `sunny` is initialized and references the return value of calling `new` method, gets passed string `Sunny`, on class `Dog`. 
The string `Sunny` gets passed through to `initialize` method, and is assigned to parameter `n` (local variable `n`). Within the `initialize` method, instance variable `@name` is set to `n`, which results in assigning the string `Sunny` to instance variable `@name`
```
## Class Variables
- Class variables are created by appending `@@class_variable_name`
- Class variables can be accessed within instance methods
## Constants
- Constants are used to store values that never need to change
- `::` is called namespace resolution
- Constants have lexical scope
	- Lexical scope 
		- Variable's scope that is determined by where the variable is initialized
		- Variable's scope consists of the structures it is defined and all of its inner levels (bypassing method and class boundaries)
		- Lexical scope will search all the way up to inheritance chain but it will use the first found one

```ruby
class Human
	CONST = "Hello"
end

puts CONST # => error since CONST is not initialized in Main
```

```ruby
CONST = "Hello"

class Human
	def initialize
		puts CONST
	end
end

Human.new # => 'Hello' | bypassing method and class boundaries
```

```ruby
CONST = "Hello from Main"

class Human
	CONST = "Hello from Human Class"
end

class Adult < Human
	def initialize
		puts CONST
	end
end

Adult.new # => "Hello from Human Class" | lexical scope search up to top chain but use the first found CONST in Human class
```

```ruby
CONST = "Hello from Main"

class Human
	CONST = "Hello from Human Class"
end

class Adult # remove inheritance
	def initialize
		puts CONST
	end
end

Adult.new # => "Hello from Main" | lexical scope search up to top chain
```

- Tricky Lexical Scope example

```ruby
class Car
	WHEELS = 4
	def wheels
		WHEELS		
	end
end

class Motorcycle < Car
	WHEELS = 2
end

car = Car.new
puts car.wheels # => 4

motorcycle = Motorcycle.new
puts motorcycle.wheels # => 4 | This invokes `wheels` method in Car class. Hence, lexical scope is search in Car class first even the calling object is in Motorcycle class, which results in outputting `4` to the console
```

- If we want to explicitly declare for Ruby to know which Constant to use

```ruby
class Car
	WHEELS = 4
	def wheels
		self.class::WHEELS		
	end
end

class Motorcycle < Car
	WHEELS = 2
end

car = Car.new
puts car.wheels # => 4

motorcycle = Motorcycle.new
puts motorcycle.wheels # => 2
```

```ruby
class  Car
	WHEELS = 4
	def wheels
		WHEELS
	end
end

class Motorcycle < Car
	WHEELS = 2
	def wheels
		WHEELS
	end
end

car = Car.new
puts car.wheels # => 4

motorcycle = Motorcycle.new
puts motorcycle.wheels # => 2 This invokes the `wheels` method in Motorcycle class since this `wheels` method overrides the `wheels` method in Car class. Thus, lexical scope is search for WHEELS constant in Motorcycle class first, which results in outputting `2` to the console
```
## Constructor Method
- `initialize` method is called `constructor`, it's a special method that builds the object when a new object is instantiated. It gets triggered by `new` class method

```ruby
class Dog
	attr_accessor :name, :age
	def initialize(n, a)
		# Option 1: use instance variables
		@name = n
		@age = a
		# Option 2: use setter methods
		self.name = n
		self.age = a
	end
end
```

- Calling constructor outside of the method
```ruby
puts sparky.name # Invoke etter method `name` on object `sparky`
sparky.name = "Sunny" # Sugar syntax of Ruby
					   # sparky.name= "Sunny"
```
## Instance Methods
- Instance methods have access to instance variables
## Accessor Methods
- Accessor methods include getter methods and setter method
- Shortcut is `attr_accessor` / `attr_reader` / `attr_writer`
- Setter method always return the value got passed in as an argument

```ruby
class GoodDog 
	def initialize(name) 
		@name = name 
	end
	
	def get_name 
		@name 
	end
	
	def set_name=(name) 
		@name = name 
	end
	
	def speak 
		"#{@name} says arf!" 
	end 
end
```

```ruby
# Longer version
class GoodDog
	def initialize(name) 
		@name = name 
	end
	
	def get_name 
		@name 
	end
	
	def set_name=(name) 
		@name = name 
	end
	
	def speak 
		"#{@name} says arf!" 
	end 
end

# Shorter version
class GoodDog
	attr_accessor :name
	def initialize(name) 
		@name = name 
	end
	
	def speak 
		"#{name} says arf!" # use getter method `name`
	end 
end

sparky = GoodDog.new("Sparky") 
puts sparky.speak 
puts sparky.name # => "Sparky" 
sparky.name = "Spartacus" # Use setter method here to change name
puts sparky.name # => "Spartacus" Use getter method to display name
```

- Getter and Setter methods can be called inside and outside of the class
	- Inside of class
		- Getter `name`
		- Setter `self.name`
	- Outside of class
		- Getter `some_object.name`
		- Setter `some_object.name = `
- `self` prefix can be used  with any instance method
## Class Methods
- Class methods are used to keep functionality that does not just pertain to individual objects
- Class methods can be called directly on the class without having to instantiate objects ``
- Class methods are defined by `def self.class_method_name`
## Modules
- Module is a group of reusable code in one place
- Modules are used in classes by using `include` method invocation, followed by the module name
- Module are also used as `namespace`

```ruby
module Speakable
  def speak(sound)
    puts sound
  end
end

class Dog
  include Speakable
end

class Human
  include Speakable
end

sunny = Dog.new
uy = Human.new
sunny.speak "Woof!!!"
uy.speak "Hello!!!"
``` 

### Using Modules as `namespacing`
- Organizing similar classes under a module
- The benefits of using modules for namespacing are
	- Easy for us to recognize related classes in our code
	- Reduce classes colliding with other smimilar named classes in our codebase

```ruby
module Elementary
  class Teacher
    def info
      "Elementary teacher"
    end
  end
end

module Highschool
  class Teacher
    def info
      "Highschool teacher"
    end
  end
end

elementary_teacher = Elementary::Teacher.new
highschool_teacher = Highschool::Teacher.new

p elementary_teacher.info # => "Elementary teacher"
p highschool_teacher.info # => "Highschool teacher"
```

### Using Modules as `container`
- Using modules to house other methods
- The benefit of using modules as container is to hold out of place methods

```ruby
module Conversions
  def self.pounds_to_kilos(pounds)
    pounds * 0.453
  end
end

class Dog
  include Conversions

  def weight(weight_in_pound)
    @weight_in_pound = Conversions.pounds_to_kilos(weight_in_pound)

    "The dog is weight #{@weight_in_pound.round(2)} kg"
  end
end

sunny = Dog.new
puts sunny.weight(50) # => The dog is weight  22.65 kg
```
## Method Lookup Path
- Use `ancestors` method to show the lookup path
- Lowest level class to highest level class
```markdown
---Dog ancestors---
Dog
Speakable
Object
Kernel
BasicObject

---Human ancestors---
Human
Speakable
Object
Kernel
BasicObject
```

- The order of modules and classes are important

```ruby
module Walkable
	def walk
		"I'm walking"
	end
end

module Swimmable
	def swim
	"I'm swiming"
	end
end

module Climable
	def swim
	"I'm climbing"
	end
end

class Animal
	include Walkable
	def speak
	"I'm an animal, and I speak!"
	end
end

class Dog  < Animal
	include Swimmable
	include Climable # This will get looked up first
end

puts  Dog.ancestors

---Dog method lookup---
Dog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
```
## `to_s`  and `puts` Methods
- `puts` automatically calls `to_s` which  is built in to every class in Ruby
	- `puts sunny` == `puts sunny.to_s`
- `to_s` method returns the name of the object's class and the encoding of the object id by default
- Custom `to_s` method to override default one
- Ruby expects `to_s` to always return string
	-  If custom `to_s` does not return string, Ruby will search in the inheritance chain for another `to_s` that returns string
- `puts` method call `to_s` for any argument that is not array. For an array, it calls `to_s` for each element and writes on separate line

## `inspect` and `p` Methods
- `p` automatically calls `inspect` method
-  `inspect` method is helpful for debugging so don't override it
- `p sunny` == `puts sunny.inspect`

## More about `self`
 - `self` is a keyword used to identify the currently-executing receiver (Object of the current "frame")
- Inside of instance method
	- When an instance method use `self`, it references the  `calling object`
	- Calling `self` before setter methods  to disambiguate between initializing  a local variable and calling a setter method
	- For setter methods `self.name=`  == `sunny.name=` (outside of the class)
- Outside of instance method
	- Calling `self`  refers to the class itself
	- Defining class method `def self.class_method_name`
	- `def self.name=(n)` == `GoodDog.name=(n)`

## Private, Protected and Public
- They are called `access modifiers`
### Protected vs Private
- They are both prevent access from outside of the class
-  They are both allow access/ invoke within the class just like with public methods
- Protected methods allow access between class instances
- Private methods do not allow access between class instances

```ruby
class Dog
  def initialize(weight)
    @weight = weight
  end

  def heavier?(other_dog)
    weight > other_dog.weight
  end

  protected # protected keyword allows access between clas instances
  attr_reader :weight
end

sunny = Dog.new(100)
boxer = Dog.new(80)


puts sunny.heavier?(boxer) #  => true
```
## Collaborator  Objects
- Collaborator objects is part of another object's state and can be any object of any class
- Collaboration is a way of modeling relationships between different objects
- The Collaborators object allows access from the main object that contains a Collaborator object in its state. This access enables calling any methods available in the Collaborator's class
- Collaboration occurs when one object is added to state of another object, but the collaborative relationship exists in the design with intention of our code

## Equivalence
- `str1 == str2` 
	- == "Are the values within the two objects the same?"
	- != "Are the two variables pointing to the same object?"
- `str1.equal? str2`
	- == "Are the two objects the same?
- `==` original method is in `BasicObject` class which is the parent class for all classes in Ruby
- Each class should define its own `==` method
- In custom class, `==` and `equal?` are the same because of default implementation. Our intention is to define
	- `==`  to ask "Are the values within the two objects the same?"
	- `equal?` to ask "Are the two objects the same?" / "Are the two variables pointing to the same object?"
- Do not define `equal?`
- Comparing two objects' `object_id` == comparing them with `equal?`
- `= = =` is used in `case` statements
- `eql?` is used by `hash`

## Variable Scope
#### Instance Variable Scope
- Instance  variable scope is at object level, this results instance variable is initialized in one instance method can be used in another instance method
- Uninitialized instance variable when get referenced will return `nil`

```ruby
class Person
	def initialize(n)
		@name = n
	end
	
	def get_name
		@name
	end

	def get_age
		@age # @age is not initialized yet
	end
end

bob = Person.new("bob")

p bob.get_name # => "bob"

p bob.get_age # => nil
```

#### Class Variable Scope
- All objects share only one  copy of class variable
- Class methods can access class variable if the variables has been initialized prior to  calling the method
#### Constant Variable Scope
- Constants has **lexical scope**
- Lexical scope means that where the constant is defined in the source code determines where it is available
- Ruby always search lexical scope of the reference, then search the inheritance chain of the enclosing structure until the top level

## Fake Operators

| Method | Operator                                                                               | Description                                                                         |
| ------ | -------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| no     | `.`, `::`                                                                              | Method/constant resolution operators                                                |
| yes    | `[]`, `[]=`                                                                            | Collection element getter and setter.                                               |
| yes    | `**`                                                                                   | Exponential operator                                                                |
| yes    | `!`, `~`, `+`, `-`                                                                     | Not, complement, unary plus and minus (method names for the last two are +@ and -@) |
| yes    | `*`, `/`, `%`                                                                          | Multiply, divide, and modulo                                                        |
| yes    | `+`, `-`                                                                               | Plus, minus                                                                         |
| yes    | `>>`, `<<`                                                                             | Right and left shift                                                                |
| yes    | `&`                                                                                    | Bitwise "and"                                                                       |
| yes    | `^`, `\|`                                                                              | Bitwise exclusive "or" and regular "or" (inclusive "or")                            |
| yes    | `<=`, `<`, `>`, `>=`                                                                   | Less than/equal to, less than, greater than, greater than/equal to                  |
| yes    | `<=>`, `==`, `===`, `!=`, `=~`, `!~`                                                   | Equality and pattern matching (`!~` cannot be directly defined)                     |
| no     | `&&`                                                                                   | Logical "and"                                                                       |
| no     | `\|`                                                                                   | Logical "or"                                                                        |
| no     | `..`, `...`                                                                            | Inclusive range, exclusive range                                                    |
| no     | `? :`                                                                                  | Ternary if-then-else                                                                |
| no     | `=`, `%=`, `/=`, `-=`, `+=`, `\|=`, `&=`, `>>=`, `<<=`, `*=`, `&&=`, `\|=`, `**=`, `{` | Assignment (and shortcuts) and block delimiter                                      |

- `.` and `::` are highest precedence of all operators
- `==`  equality operator is one the most common fake operators
	- Only override `==` and `! =` at the same time, this creates  unexpected outputs
- `+` plus method generally returns a new object after it got invoked. Thus, when overriding `+` method, always aim to return a new object
- `[]` element getter and  `[]=` element setter methods
	- `arr[2]` == `arr.[](2)`
	- `arr[2] = "hello"` == `arr.[]=(2, "hello"`

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
dream_team.name = "Dream Team"

dream_team[4]
dream_team[5] = Person.new("JJ", 72)

puts dream_team.inspect
```

```ruby
# Container Modules
module Conversions
  def self.pounds_to_kilos(pounds)
    pounds * 0.453
  end
end

class Dog
  include Conversions

  def weight(weight_in_pound)
    @weight_in_pound = Conversions.pounds_to_kilos(weight_in_pound)
    "The dog is weight #{@weight_in_pound} kg"
  end
end

dog = Dog.new
puts dog.weight(50)
```

## Exceptions
- Exception class hierarchy

```
Exception  
	NoMemoryError  
	ScriptError  
		LoadError  
		NotImplementedError  
		SyntaxError  
SecurityError  
SignalException  
	Interrupt  
StandardError  
	ArgumentError  
		UncaughtThrowError  
	EncodingError  
	FiberError  
	IOError  
		EOFError  
	IndexError  
		KeyError  
		StopIteration  
	LocalJumpError  
	NameError  
		NoMethodError  
	RangeError  
		FloatDomainError  
	RegexpError  
	RuntimeError  
	SystemCallError  
		Errno::*  
	ThreadError  
	TypeError  
	ZeroDivisionError  
SystemExit  
SystemStackError  
fatal
```

- Basic syntax

```ruby
begin
	# code at risk of failing
rescue ArgumentError
	# take action
rescue TypeError, ZeroDivisionError
	# take action
end
```

- Exception Objects are just normal Ruby objects

```ruby
rescue TypeError => e 
# store the exception object in `e`
# `#message` method is used to return the error message
# `backtrace` method is used to backtrace the error
```

