# Study Guide

- [Closures](#closures)

- [Blocks/Procs/Lambdas](#blocks-procs-and-lambdas)

- [Bindings](#binding)

- [Block Arguments](#block-arguments)

- [When to use blocks](#when-to-use-blocks)

- [Returning a closure](#returning-a-closure)

- [Symbol to Proc](#symbol-to-proc)

- [Yielding](#yielding)

- [Arity](#arity)

- [Testing](#testing)

- [Language](#language)

- [Minitest vs RSpec](#minitest-vs-rspec)

- [SEAT](#seat-approach)

- [Assertions](#assertions)

- ****[Packaging Code into a Project](#packaging-code-into-a-project)

- [DSL](#domain-specific-language)

- [RubyGems](#rubygems)

- [Bundler](#bundler)

- [Gemfile](#gemfile)

- [Rake](#rake)

- [Code Coverage](#simplecov-code-coverage)

- [.gemspec](#gemspec)
---

# Closures
> Closure is an unnamed chunk of code , delimited by `do..end` or `{..}`, that encloses surrounding artifacts as `binding`, enabling them to be referenced or executed when needed.
> 
> A closure can be implemented by:
> - Using `block`
> - Using `Proc` object
> - Using `lambdas`

---

## Blocks, Procs and Lambdas

### Blocks
> A block is a type of closure that is created at method invocation and get executed using `yield` keyword. Unlike `Proc` object, blocks can not be saved to variables, so they can only be executed when the method they were passed to is called.

```ruby
def greeting
	puts "#{yield}"
end

greeting { "hello world" } # hello world
```

### Procs
>A `Proc` object is a saved closure, allowing the "chunk of code" to be passed around a codebase and executed at a later time.

```ruby
greet = Proc.new { puts "hello world" }
# codebase...
greet.call # => hello world
```

### Lambdas
>Like a `Proc` object, a `lambda` is a saved closure that can be executed at a later time. Unlike a `Proc`, the `lambda` has strict arity, meaning that if the incorrect number of arguments are passed to it, it will throw an exception.

---

## Binding
https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e

"...the Proc keeps track of its surrounding context, and drags it around wherever the chunk of code is passed to. In Ruby, we call this its binding, or surrounding environment/context."

"Note that any local variables that need to be accessed by a closure must be defined before the closure is created, unless the local variable is explicitly passed to the closure when it is called"

> When a closure is instantiated, a binding is created at the location of instantiation that keeps track of the surrounding artifacts (variables, methods, etc.) allowing access to these artifacts.  Variable must be initialized before a `binding` is created, so a closure can have access to its pointer.

```ruby
def foo(prc)
	prc.call
end

name = "Joe"
a_proc = Proc.new { puts "name is reassigned: #{name}" }

name = "Henry"
foo(a_proc)
```

---

## Block Arguments

### Implicit Blocks
"Every method, regardless of its definition, takes an implicit block. It may ignore the implicit block, but it still accepts it."

>All methods, both custom and core methods in Ruby Library, take implicit block. `block_given?` method can be used to check whether a block gets passed in as argument.

```ruby
def foo
	puts "hello world"
end

foo { puts "Ruby"} # => "hello world"
```

### Explicit Blocks
https://launchschool.com/lessons/c0400a9c/assignments/5a060a20

"However, there are times when you want a method to take an explicit block; an explicit block is a block that gets treated as a named object -- that is, it gets assigned to a method parameter so that it can be managed like any other object -- it can be reassigned, passed to other methods, and invoked many times."

"Why do we now need an explicit block instead? Chiefly, the answer is that it provides additional flexibility. Before, we didn't have a handle (a variable) for the implicit block, so we couldn't do much with it except yield to it and test whether a block was provided. Now we have a variable that represents the block, so we can pass the block to another method:"

>A method can be defined with a parameter prepended with `&`, that takes a block as argument explicitly. Ruby converts the block to a `Proc` object and it can be invoked using `Proc#call` method.
>
>Methods that take an explicit block allow for greater flexibility. An explicit block, once converted to a `Proc` objectTycan be assigned to a local variable, used as a return value, and passed to other methods.

```ruby
def foo(&block)
	another_foo(block)
end

def another_foo(blk)
	puts "another_foo method is invoked!"
	blk.call
end

foo { puts "hello world" } # => "another_foo method is invoked!"
								# => "hello world"
```

## When to use blocks
https://launchschool.com/lessons/c0400a9c/assignments/5a060a20

There are two primary instances where the implementation of a block is useful within an application:

- Deferring extended implementation at the time of a method invocation
	- The method implementor defines a method that gives the method users the ability to implement specific details through the use of closures.
- Incorporating **sandwich code** structure within a method
	- Sandwich code has a common "before" and "after" method execution while leaving the "meat" of the invocation flexible to the specific implementation of the method user.

```ruby
def increment(num)
	puts num
	new_num = yield(num)
	puts new_num
end

increment(10) { |n| n + 1 }
```

---
## Returning a Closure
"Methods and blocks can return a chunk of code by returning a `Proc` or `lambda`."

Method/block can return closure which establishes a new binding each iteration. 

```ruby

def increment
	counter = 0
	Proc.new { count += 1 }
end

num1 = increment # A Proc object
num1.call # => 1
num1.call # => 2

num2 = increment(10) # Another Proc object
num2.call # => 11
num2.call # => 12

num1.call # => 3 (num1 continues)

```

Because a new binding is established upon the instantiation of each `Proc` object, the value referenced by `count` will be different. For example, on line 5 when `num1` is assigned, the `increment` method is first invoked, which has `count` set to `0`. A `Proc` object is instantiated, establishing a new binding which sees the assignment of `count`, then returned from the method, assigning the `Proc` itself to `num1`. When called on line 6, because the `Proc` binding sees `count = 0`, the closure *reassigns* `count` to `1` within this iteration of `increment`. On line 9, a *new* invocation of `increment` is executed, which instantiates a different `Proc` object with a separate binding. Because these 2 bindings exist within separate instances of `increment`, `num2` sees the incrementation of `11` and `12`, while `num1` continues to move to `3` on line 13.

---
## Symbol to Proc
When prepending a method argument with `&`, Ruby first tries to convert it into a block. If the object is not a `Proc`, Ruby will then try to call the `Symbol#to_proc` method to convert it into a `Proc` so that it can be passed in as a block.

```ruby
def transform(string)
	yield(string)
end

upcase_proc = :upcase.to_proc

transform('hello', &:upcase) # => "HELLO"
transform('hello', &upcase_proc) # => "HELLO"
```

---
## Yielding
"If your method implementation contains a yield, a developer using your method can come in after this method is fully implemented and inject additional code in the middle of this method (without modifying the method implementation), by passing in a block of code."

The `yield` keyword executes the block that got passed into a method invocation. When `yield` get passed in arguments, the values assigned will be bound to any parameters within the block.

---
## Arity
"The rule regarding the number of arguments that you must pass to a block, proc, or lambda in Ruby is called its arity."

Arity refers to how a structure handles arguments that are passed into it.
- Blocks and `Proc` objects contain *lenient arity*, which means that they are not affected with the incorrect number of arguments passed in.
- Methods and lambdas have *strict arity*, which means that they must have the correct amount of arguments, dictated by the amount of parameters,  otherwise an `ArgumentError` will be raised.

### Lenient Arity
"In Ruby, blocks and procs have lenient arity, which is why Ruby doesn't complain when you pass in too many or too few arguments to a block."

```ruby
def foo
	yield("hello", "world") # passed 2 strings in as arguments
end

foo do |wrd|
	puts wrd
end
# only ouputting the first string
# hello
```

### Strict Arity

"Methods and lambdas, on the other hand, have strict arity, which means you must pass the exact number of arguments that the method or lambda expects."

---
# Testing
## Language

### Test Suite
"The entire set of tests that accompanies your program or application. You can think of this as *all the tests* for a project."

A test suite is a collection of all of the test for an application.

### Test
"A situation or context in which tests are run. For example, this test is about making sure you get an error message after trying to log in with the wrong password. A test can contain multiple assertions."

A test is a specific situation of executed code, using a collection of assertions to verify that the application is working as intended.
### Assertion
"The actual verification step to confirm that the data returned by your program or application is indeed what you expected. You make one or more assertions within a test."

An assertion is the actual verification step which confirms that the returned data matches the expectation result.

```ruby

class PersonTest < Minitest::Test # Test Suite: PersonTest

def test_name                     # Test: test_name
	joe = Person.new("Joe") 
	assert_equal("Joe", car.name)  # Assertion: assert_equal
end
end
```

## Minitest vs RSpec

### Minitest
- Comes installed with Ruby
- Uses normal Ruby syntax
	- Simple to write
- Assertion syntax

```ruby
require 'minitest/autorun'
require_relative 'car'

class CarTest < Minitest::Test
	def test_wheels
		car = Car.new
		assert_equal 4, car.wheels
	end
end
```

- Expectation syntax
	- Uses `expectationj matchers` rather than assertions to check the returned data. This reads much more to RSpec

```ruby
require 'minitest/autorun'
require_relative 'car'

describe 'Car#wheels' do
	it 'has 4 wheels' do

		car = Car.new

		(car.wheels).must_equal 4
end
end
```

### RSpec
- Does not come installed with Ruby
- A DSL that uses more naturally reading code
	- Difficult to write

## SEAT Approach
https://launchschool.com/lessons/dd2ae827/assignments/5c80633e

```ruby

class CarTest < Minitest::Test
	def setup # S
		@car = Car.new
	end 

	def test_wheels
		wheels = @car.wheels # E
		
		assert_equal 4, wheels # A
	end
	
	def teardown # T
		puts "End of test"
	end
end
```

### S
"Set up the necessary objects."
Set up the objects that will be used throughout testing.

### E
"Execute the code against the object we're testing."
Execute code that will produce a specific result.

### A
"Assert that the executed code did the right thing."
Assert that the executed code produced the expected result.

### T
"Tear down and clean up any lingering artifacts."
Tear down any remaining used throughout testing.

## Assertions

### `assert`
Fails unless its argument evaluates as true.

```ruby
assert 'hello'
```

### `assert_equal`
Fails unless the expected return matches the *value* of the actual return.

```ruby
assert_equal 'Bob', Person.new('Bob').name
```

### `assert_same`
Fails unless the expected return matches the *object id* of the actual return.

```ruby
assert_same 4, Car.new.wheels
```

### `assert_nil`
Fails unless its argument returns `nil`
  
```ruby
assert_nil puts 'Hello'
```

### `assert_raises`
Fails unless the code executed within its block produces the argument exception.

```ruby
assert_raises(ArgumentError) do
	hash.key?
end

```

### `assert_includes`
Fails unless the provided element is included in the given collection.

```ruby
assert_includes nums, 5
```

### `assert_instance_of`
Fails unless the provided object is an instance of the given class.

```ruby
assert_instance_of String, 'Hello World!'
```

### Refutation
Most assertions contain its opposing counterpart, a **refutation**. These will pass *unless* the refutation matches.

---
# Packaging Code into a Project

## DSL (Domain Specific Language)
Domain Specific Language is specialized syntax used to write code for a specific application. This syntax is determined by the program, allowing for greater flexibility and code that reads like natural language.

## Ruby Version Manager
https://launchschool.com/books/core_ruby_tools/read/ruby_version_managers

"Ruby version managers are programs that let you install, manage, and use multiple versions of Ruby."

Because Ruby is a fast-growing programing language that sees periodic updates, different projects may require different versions of Ruby. In order to easily manage the current version of Ruby that your computer uses, a *Ruby Version Manager* can be ultilized to install, manage and switch to the required version of Ruby.
Most common Ruby version managers are : **RVM** and **rbenv**

## RubyGems
https://launchschool.com/books/core_ruby_tools/read/gems

"RubyGems, often just called Gems, are packages of code that you can download, install, and use in your Ruby programs or from the command line."

RubyGems are packages of code that perform a specific task in conjunction with a Ruby program or the command line.

Common gems: pry, Rubocop, minitest, bundler, rake

## Bundler
https://launchschool.com/books/core_ruby_tools/read/bundler

"Bundler lets you describe exactly which Ruby and Gems you want to use with your Ruby apps. Specifically, it lets you install multiple versions of each Gem under a specific version of Ruby and then use the proper version in your app."

The **Bundler** RubyGem acts as a dependency manager, allowing the programmer to dictate which version of Ruby and RubyGems their program will use.

### Gemfile
"Bundler relies on a text file named Gemfile to tell it which version of Ruby and its Gems it should use. This file is a simple Ruby program that uses a Domain Specific Language (DSL) to provide details about the Ruby and Gem versions. It's the configuration or instruction file for Bundler."

The `Gemfile` file within a program configures the dependencies that the application will use. Within this file, the programmer can indicate which version of both Ruby and the included RubyGems that are required, using a Domain Specific Language to include details for each. After all changes have been indicated, the `bundle install` command can be executed within the terminal, creating a `Gemfile.lock` file that includes all of the application's version information
  
```ruby
source 'https://rubygems.org'

ruby '3.1.0'

gem 'minitest', '~> 5.10'
gem 'minitest-reporters', '~> 1.1'
gem 'stamp', '~> 0.6'
gem 'rake'
```

Gemfile.lock

```
GEM
  remote: https://rubygems.org/
  specs:
    ansi (1.5.0)
    builder (3.2.4)
    minitest (5.23.0)
    minitest-reporters (1.6.1)
      ansi
      builder
      minitest (>= 5.0)
      ruby-progressbar
    rake (13.2.1)
    ruby-progressbar (1.13.0)
    stamp (0.6.0)

PLATFORMS
  ruby
  x86_64-darwin-23

DEPENDENCIES
  minitest (~> 5.10)
  minitest-reporters (~> 1.1)
  rake
  stamp (~> 0.6)

RUBY VERSION
   ruby 3.1.0p0

BUNDLED WITH
   2.5.10
```

### Dependency
"...multiple versions of Ruby and multiple versions of Gems"

### `bundle exec`
"We use it to resolve dependency conflicts when issuing shell commands."
https://launchschool.com/books/core_ruby_tools/read/bundler#bundleexec

Resolve dependency issues

## Rake
https://launchschool.com/books/core_ruby_tools/read/rake

"Rake is a Rubygem that automates many common functions required to build, test, package, and install programs"

Rake is a RubyGem that automates frequently used processes throughout an application project, including the building, testing, packaging, and other repeated tasks of the project.

```ruby
require "rake/testtask"
require "find"
require ' bundler/gem_tasks'

desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end

desc 'Run tests'
task :default => :test

desc 'Display inventory of all files'
task :inventory do
  Find.find('.') do |name|
    next if name.include?('/.')
    puts name if File.file?(name)
  end
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
```

## .gemspec
"Most Ruby projects use Rubygems as the distribution mechanism. This requires that you observe certain practices when building your project. Specifically, you must use a common directory structure and you must supply a `.gemspec` file."

```
Gem::Specification.new do |s|
  s.name        = 'todolist_project'
  s.version     = '1.0.0'
  s.summary     = 'Todo List Manager!'
  s.description = 'This is a simple todo list manager!'
  s.authors     = ['Uy Nguyen']
  s.email       = 'uyhdnguyen@gmail.com'
  s.homepage    = 'http://uynguyen.com/todolist_project'
  s.files       = ['lib/todolist_project.rb', 'test/todolist_project_test.rb']
end
```

## SimpleCov (Code Coverage)
https://launchschool.com/lessons/dd2ae827/assignments/9f7c1f7c

"When writing tests, we want to get an idea of code coverage, or how much of our actual program code is tested by a test suite."

"Note that even though we are only testing public code, code coverage is based on all of your code, both public and private. Also, this doesn't mean every edge case is considered, or even that our program is working correctly. It only means that we have some tests in place for every method. "
