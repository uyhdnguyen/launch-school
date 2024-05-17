# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

# Examples:

# def compute
#   if block_given?
#     yield
#   else
#     "Does not compute."
#   end
# end

# def compute
#   return "Does not compute." unless block_given?
#   yield
# end

def compute(var)
  if block_given?
    yield(var)
  else
    "Does not compute."
  end
end

p compute(10) { |num| num } == 10
p compute("c") { |char| 'a' + 'b' + char } == 'abc'
p compute(3) == 'Does not compute.'