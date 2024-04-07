require 'pry'

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
    # binding.pry
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name) #@name = "Fluffy"
puts fluffy.name # "Fluffy"
puts fluffy # "My name is Fluffy"
puts fluffy.name 
puts name

=beginn
name = 42
fluffy = Pet.new(name) # @name = "42"
name += 1 # Reassign local variable `name` to integer 43
puts fluffy.name # "42"
puts fluffy # "My name is 42"
puts fluffy.name # "42"
puts name  # 43 Because this output local variable  `name`
=end