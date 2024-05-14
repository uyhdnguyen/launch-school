## What is OOP and why is it important?
Object Oriented Programming is a  concept that's created to deal with large software systems by creating containers for data. It enables programmers to change/ manipulate  parts of the code base without affecting the entire program.

## What is encapsulation?
Encapsulation is the act of hiding information and functionality of objects from other parts of the codebase. In Ruby,  encapsulation is achieved by  the use of objects, and exposing interfaces to interact with those objects.

```ruby
class Person

attr_reader :name

	def initialize (name)
	@name = name
	end

private

attr_writer :name
end

joe = Person.new("Joe")
p joe.name
joe.name = "Henry" # => Error
```
## How does encapsulation relate to the public interface of a class?
Encapsulation bundles data and operations within a class. It defines which states and behaviors can be accessed to other parts of the program. The public interface becomes the gateway for interacting with the class, which give access to internal data.

## What is abstraction?
Abstraction is the act of hiding the implementation of something and just focus on what it does.

```ruby
def double(num)
	num * 2
end

def double(num)
	num + num
end

double(3) # => We do not need to know how method is implemented. We just care what the method does which is the return value will be doubled.
```

```ruby
class Person
	include Walkable
end
```
## What is an object?
Objects are created from classes. Each individual object from the same class contains different states.

## What is a class?
Class is blueprint for creating object. Class defines states and behaviors of its objects.
To create a class in Ruby,  the `class` keyword is used and followed by the class name.
## What is instantiation?
Instantiation is a process of creating an instance from a class by invoking `new` method on that class. As the result, the return value is a new object.

## What is polymorphism?
Polymorphism  allows data of different types can responds to a common interface. There are two main ways to achieve polymorphism

## Explain two different ways to implement polymorphism?
- Polymorphism can be implemented via inheritance.
	- Inheritance can be provided via class inheritance which occurs when a class inherits the behaviors of another class. In addition, inheritance can be provided via mixin which occurs when modules contain shared behaviors that get mixed in one class or multiple classes using `include` method call. The important thing is we can create object from classes but not from modules.
	- There are several factors when we prefer to use class inheritance versus mixin. Firstly, one class can only have one super class, but we can mix in as many module as needed. Secondly, if an instance of one class `is-a` another kind of another class, we prefer to use class inheritance. On the other hand, if a class may be has the behaviors of a type, but this type and our class do not have `is-a` relationship, we should design this type as module and mixin our class.
- Polymorphism can be implemented via duck-typing. This occurs when unrelated objects from different classes share a common behavior and can be grouped together with intention.

```ruby
module Swimmable
	def swim
	puts "I'm swimming"
	end
end

class Person
	def sleep
	puts "I'm sleeping"
	end
end

class Adult < Person
	include Swimmable
end

class Teenager < Person	
	include Swimmable
end

class Baby < Person
end

[Adult.new, Teenager.new, Baby.new].each(&:sleep)

[Adult.new, Teenager.new].each(&:swim)


class Stove
	def routine_check
	puts "checking temperature"
	end
end

class Register
	def routine_check
		puts "counting initial money"
	end
end

class Server
	def routine_check
		puts "checking tables"
	end
end

# Morning routine check

[Stove.new, Register.new, Server.new].each(&:routine_check)
```
## How does polymorphism work in relation to the public interface?
Polymorphism can be implemented via interface inheritance. Interface Inheritance occurs when multiple, but not all, subclasses of a superclass share a common behavior which can be extracted to a module and included into the necessary classes as a mixin.

## What is duck typing? How does it relate to polymorphism? What problem does it solve?
Duck typing occurs when unrelated objects from different classes share a common behavior and can be grouped together with intention. 
Duck typing is the way to achieve polymorphism because it enables different object types to respond to the same method call.
Duck typing gives programmer the flexibility to focus on the behavior of objects rather than their their types/ classes. In other words, if  objects respond to the same method call and they are designed with intention, they can be used in that context regardless of theirs classes.

## What is inheritance?
Class inheritance is the traditional way of inheritance. Class Inheritance occurs when a class inherits the behaviors of another class, referred to as superclass. 
The other form is called Interface Inheritance which occurs when class does not inherit from another class but inherits the interface provided by the mixin module.

## What is the difference between a superclass and a subclass?
A class inherits behaviors from another class is called subclass. The superclass is a class where its behaviors are inherited by other subclasses.

## What is a module?
Module is a collection of behaviors that is usable in other classes. A module is defined by using keyword `module` followed by the name of the module. 

Modules can be used as namespacing which make it easier to read in our code base by grouping related classes. Also, namespacing can be used to prevent classes that have the same name from colliding to each other

Modules also can be used as container which contains out of place methods.

```ruby
# namespace
module Toy
  class Excavator
    def initialize
      puts "I'm a toy excavator"
    end
  end
end

module Machinery
  class Excavator
    def initialize
      puts "I'm an excavator"
    end
  end
end

toy_excavator = Toy::Excavator.new
excavator = Machinery::Excavator.new

# container
module Conversion
  def self.pound_to_kilo(lb)
    lb * 0.435
  end
end

class Dog
  def display_weight_in_kilo(pound)
    puts Conversion.pound_to_kilo(pound)
  end
end

dog = Dog.new
dog.display_weight_in_kilo(100) # => 43.5
```

## What is a mixin?
Mixin refers to a process of adding modules into classes in order to use behaviors that are defined in those modules.

## When is it good to use inheritance?
Inheritance works great when it's used to model hierarchical domains
## In inheritance, when would it be good to override a method?
When some of the subclasses have slightly different behaviors. (Person -> Adult, Baby -> run)
## What is the method lookup path?
Method lookup path is the order in which Ruby will go through the class hierarchy to look for methods to invoke.

## When defining a class, we usually focus on state and behaviors. What is the different between these two concepts?
States refers to the data associated to an individual objects which are traced by instance variables. Behaviors are what objects can do.
In summary, every object within a  class has distinct states to differentiate them from one another, yet all objects within the same class share the same behaviors.
## How do you initialize a new object?
`initialize` method, is called `constructor`, is used to build the object when a new object is `instantiated`. Constructor method is invoked when the `new` method is called on the class.

## What is a constructor method?
The constructor method is called when we instantiate a new object by calling `new` method on the class.

## What is an instance variable, and how is it related to an object?
Instance variables are used to keep track of properties of objects. Instance variable has `@` followed by instance variable name.
Instance variables exist as long as the object instance exists.

## What is an instance method?
Instance methods define what objects are capable of doing.

## How do objects encapsulate state?
Instance variables are used to tie data to objects. Each object has its own states which can normally be encapsulated by initialized instance variables in constructor method which is called every time a new object is created by invoking `new` method on the class.

## What is the difference between classes and objects?
Classes group common behaviors and objects encapsulate state
## How can we expose information about the state of the object using instance methods?
Instance variables are used to keep track of states of objects. Therefore, we could return instance variables using instance methods in order to give access to states of objects.

## What is a collaborator object, and what is the purpose of using collaborator objects in OOP?
Collaborator objects is part of another object's state and can be any object of any class. 

The Collaborators object allows access from the main object that contains a Collaborator object in its state. This access enables calling any methods available in the Collaborator's class

## What is an accessor method?
Accessor method is a method used to read or write the value of an object's attribute. Therefore, accessor methods provide way to retrieve or modify states of objects.

## What is a getter method?
Getter method is a method used to retrieve states of objects.

## What is a setter method?
Setter method is a method used to modify states of objects.

## What is attr_accessor?
`attr_accessor` method takes a symbol as an argument which is used to create the method name for the getter and setter methods.

## How do you decide whether to reference an instance variable or a getter method?
It's recommended to always call getter method instead of referencing an instance variable because if we need to modify the value of that instance variable, we can just modify the getter method to get it changed in one place.

## When would you call a method with self?
When we need to call the setter method to change the value of instance variable. We need to prepend with keyword `self` to differentiate setter method with local variable.

## What are class methods?
Class method is the method we can call directly on the class itself without having to instantiate an objects.

## What is the purpose of a class variable?
Class variables are used to keep track of class level detail that relates only to the class, and not to individual objects.
## What is a constant variable?
Constant variable are used when you never want to change the assigned values.
## What is the default to_s method that comes with Ruby, and how do you override this?
The default `to_s` method returns the name of the object's class and the `object_id`.  By default, whenever `puts` method is call on an object, it automatically call  the default `to_s` method on that object.
We can override default `to_s` method by defining custom `to_s` method in the body of our custom classes.
## What are some important attributes of the to_s method?
There are two important attributes of  `to_s` method that are `to_s` method is called automatically on the object when we use it with `puts` or when used with string interpolation.
## From within a class , when an instance method uses self, what does it reference?
If `self` is used inside of an instance method, `self` represent its calling object.

## What happens when you use self inside a class but outside of an instance method?
If `self` is prepended to the a method definition, it's defining a class method.

## Why use self, and how does self change depending on the scope it is used in?
Using `self.a_method`, rather than Classname.a_method is a convention when we need to rename the class, we only have to change the name of the class.

## What is inheritance, and why do we use it?
Class inheritance is the traditional way of inheritance. Class Inheritance occurs when a class inherits the behaviors of another class, referred to as superclass. 
The other form is called Interface Inheritance which occurs when class does not inherit from another class but inherits the interface provided by the mixin module.
Inheritance is a great way to remove duplication in our code base. It give us the ability to keep our code DRY (Don't Repeat Yourself)

## Give an examples of how to use class inheritance.

```ruby
class Human
	def walk
		puts "I'm walking"
	end
end

class Adult < Human; end
class Teenager < Human; end

[Adult.new, Teenager.new].each(&:walk)
```

## Give an example of overriding. When would you use it?
When some of the subclasses have slightly different behaviors. (Person -> Adult, Baby -> run)
## Give an example of using the super method. When would we use it?

```ruby
class Human
	def initialize(name)
		@name = name
	end
end

class Adult < Human
	def initialize(name)
		super
	end
end

joe = Adult.new("Joe")
p joe
```

## Give an example of using the super method with an argument.

```ruby
class Human
	def initialize(name)
		@name = name
	end
end

class Adult < Human
	def initialize(name, age)
		super(name)
		@age = age
	end
end

joe = Adult.new("Joe", 25)
p joe
```

## When creating a hierarchical structure, under what circumstance would a module be useful?
Module would be useful when we are designing a structure in which not all of the classes share the same behaviors. Therefore, we would need to extract those behaviors into a module then mix in that module to the classes that require those behaviors.

## What is interface inheritance, and under what circumstance would it be useful in comparison to class inheritance?
Interface inheritance occurs when the class does not inherit from another type, but inherits the interface provided by the mixin module.
Interface inheritance would be useful in comparison to class inheritance when we design structure that some classes has-a relationship with other classes but do not have is-a relationship.

## How is the method lookup path affected by module mixins and class inheritance?
When using inheritance, method lookup path will be affected by the order of mixins and class inheritance. The method lookup path will start first from the current class to the last module that got mixed in until there's no more modules. It will then travel up to the inheritance chain to superclass if there are any then `Object` -> `Kernel` -> `BasicObject`

## What is namespacing?
Namespacing occurs when grouping related classes in module to organize and prevent naming conflicts. 

## How does Ruby provide the functionality of multiple inheritance?
Ruby use mixing in behaviors to deal with multiple inheritance. We can mix in as many modules as we like.

## Describe the use of modules as containers.
Using modules as containers to hold out of place methods.

```ruby
module Conversion
	def self.pound_to_kilo(pound)
		pound * 0.453
	end
end

class Dog
	def display_weight_in_kilo(lb)
		weight = Conversion.pound_to_kilo(lb)
		puts "The dog is #{weight} kg."
	end
end

sunny = Dog.new
sunny.display_weight_in_kilo(50)
```

## Why should a class have as few public methods as possible?
Abstraction is one of the four fundamental of OOP. Therefore, classes should have as few public methods as possible to prevent the program to be manipulated from outside of the class.
## What is the private method call used for?
`private` is called access modifier in Ruby. It allows instance method to be called within the class and prevent access from outside of the class. Private methods do not allow access between class instances.
## What is the protected keyword used for?
`protected` keyword is called access modifier in Ruby. It allows instance method to be called within the class and prevent access from outside of the class. Protected methods allows access between class instances.

## What are the two rules of protected methods?
It allows instance method to be called within the class and prevent access from outside of the class. Protected methods allows access between class instances.

## Why is it generally a bad idea to override methods from the Object class, and which method is commonly overridden?
Because custom classes are inherited from `Object` class. Therefore, we can accidentally override methods in `Object` class which could have caused errors in our application.

## What is the relationship between a class and an object?
At object level, the states are different from other objects from the same class but they can call the same instance methods (behaviors) defined in the class.
At class level, class can have behaviors not for objects that is called class method.

## Explain the idea that a class groups behaviors?
Encapsulation is one of the fundamental concepts of OOP. Classes are used to bundle data into objects. Classes group common behaviors in order to expose the public interface so objects from this class can interact with others.