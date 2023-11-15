# What do you expect to happen when the greeting variable is referenced in the
# last line of the code below?

if false
  greeting = "hello world"
end

greeting

# Nothing since greeting is already initialized inside if/end statement
# Even though greeting is initialized, the variable nevers get executed. 
# greeting will return nil as the result
