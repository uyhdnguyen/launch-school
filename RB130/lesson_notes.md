# What is Closures in Ruby?

Closure is a concept of programming that allows programmers to save "chunk of code" to reuse it when needed.

Closure bind its surrounding artifacts and build an enclosure around them, that can be referenced when needed.

In ruby, closure is implemented by

- Instantiate an object from **Proc** class
- Using **blocks**
- Using **lambdas** (IRRELEVANT SUBJECT)

# What is the relationship  between methods and blocks?

All methods in Ruby can take implicit blocks passed in as argument. If the methods have implementation inside of the method to deal with block, they can interact with blocks.

# What is variable shadowing and why does it affect the block?

Variable shadowing occurs when block's parameters have the same name as local variables that are initialized outside of the block.

Variable shadowing prevent access from inside of the block to variables that are outside of the block.

# What is the rule for passing arguments to the block?

**Arity** is the rule for passing arguments into a block, proc or lambda.

In Ruby, blocks and procs have **lenient arity** which do not care about number of  arguments. On the other hand, methods and **lambda** have **strict arity** in which argument must be passed in exactly as defined.

# When to use blocks in methods?

There are two main use cases.

- Defer some implementation code to method invocation decision
  - The method implementor leaves small chances for method user to decide how the method will be called.
- Methods that need to perform some "before" and "after" actions - sandwich code.
  - Use cases for timing, logging, notification systems
  - Use case for `File::open` and `File::close`

# How to pass methods with explicit block parameter?

Explicit block is a block that gets treated as named object. Explicit blocks get assigned to method parameter. Simply add `&` in front of the name

Ruby converts blocks passed in as explicitly blocks to simple Proc objects. `call` method is used to call the Proc object.

# How to use Closures?

Closures are useful because they retain memory of their surrounding scope so they can use/ update variables in that scope. (Because blocks can access to variables from outer scope of the block)

Methods and blocks can return Procs and Lambdas that can be called repeatedly.

# Lesson 1 Summary

- blocks are one way that Ruby implements closures. Closures are a way to pass around an unnamed "chunk of code" to be executed later.
- blocks can take arguments, just like normal methods. But unlike normal methods, it won't complain about the wrong number of arguments being passed to it.
- blocks return a value, just like normal methods.
- blocks are a way to defer some implementation decisions to method invocation time. It allows method users to refine a method at invocation time for a specific use case. It allows method implementors to build generic methods that can be used in a variety of ways.
- blocks are a good use case for "sandwich code" scenarios, like closing a `File` automatically.
- methods and blocks can return a chunk of code by returning a `Proc` or `lambda`.

# What is binding?

Binding is the act that closures use to keep track  of surrounding environment/context to have required information to be executed when needed.

# What is Domain Specific Language?

DSL allows programmer to write code that reads like natural English, that is used in Rspec (One of popular Ruby gem used to write test)

# What is a Test Suite?

Test Suite is the entire set of tests that is used for whole application.
Test Suite refers as all of the tests for a project.

# What is a Test?

Test could be referred as tests that are used to test one feature of the program. A test can contain multiple assertions.

# What is Assertion?

Assertion refers to the verification step to confirm that the data returned by your application is as expected. There can be one or more assertions.

### What is Assertion Syntax?

Assertion/ Assert-style syntax is Ruby-like syntax. This is what will be focus in this course

### What is Expectation Syntax?

Expectation/ Spec-style syntax is different from Assertion/ Assert-style syntax.
Tests are grouped into `describe` blocks, and individual tests are written with the `it` method. It use expectation matchers.

# Minitest Summary

- Minitest is an intuitive test library. It comes installed with Ruby.
- Using Minitest is very easy, and you shouldn't be afraid to play around with it.
- Create a test file
- Create a test class by subclassing `Minitest::Test`.
- Create a test by creating an instance method that starts with `test_`.
- Create assertions with `assert_equal`, and pass it the expected value and the actual value.
- Colorize Minitest output with `minitest-reporters`
- You can skip tests with `skip`.
- Minitest comes in two syntax flavors: assertion style and expectation style. The latter is to appease RSpec users, but the former is far more intuitive for beginning Ruby developers.

# Assertions methods

[Full list of assertions](https://docs.seattlerb.org/minitest/Minitest/Assertions.html)


| Assertion                          | Description                                  |
| ------------------------------------ | ---------------------------------------------- |
| `assert(test)`                     | Fails unless`test` is truthy.               |
| `assert_equal(exp, act)`           | Fails unless`exp == act`.                    |
| `assert_nil(obj)`                  | Fails unless`obj` is `nil`.                |
| `assert_raises(*exp) { ... }`      | Fails unless block raises one of`*exp`.      |
| `assert_instance_of(cls, obj)`     | Fails unless`obj` is an instance of `cls`. |
| `assert_includes(collection, obj)` | Fails unless`collection` includes `obj`.   |

# What is SEAT?

SEAT is the way to write a test

- Setup the objects
- Execute the code against the object we're testing
- Assert if the results are as expected
- Tear down and clean up lingering artifacts as neeeded

# Minitest Guide
