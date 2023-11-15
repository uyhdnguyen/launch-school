# Alan wrote the following method, which was intended to show all 
# of the factors of the input number:

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# Alyssa noticed that this will fail if the input is 0, or a negative number, 
# and asked Alan to change the loop. How can you make this work without using 
# the begin/end until construct? Note that we're not looking to find the factors 
# for 0 or negative numbers, but we just want to handle it gracefully instead 
# of raising an exception or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1
# What is the purpose of the number % divisor == 0 ?

# The purpose is to find the factors of given_number

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method
# (the factors before the method's end)?

# Implicitly return factors when the method is called

# The purpose of line 8 is to make factors the return value of the method.
# Recall that without an explicit return statement in the code, the return
# value of the method is the last statement executed. If we omitted this line,
# the code would execute, but the return value of the method would be nil.