# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

def uppercase?(string)
  string = string.delete('^a-z0-9')
  sample = string.upcase
  p string == sample
end

def uppercase?(string)
  string == string.upcase
end

uppercase?('t')
uppercase?('T')
uppercase?('Four Score')
uppercase?('FOUR SCORE')
uppercase?('4SCORE!')
uppercase?('')