# Print all odd numbers from 1 to 99, inclusive, to the console, with each
# number on a separate line.

def odd_numbers()
  range = (1..99).to_a
  range.each { |num| puts num if num.odd? }
end

odd_numbers