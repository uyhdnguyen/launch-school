=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return 
the letter count in a hash with 'letter' as key and count as 'value'. 
he key must be 'symbol' instead of string in Ruby and 'char' instead of string
in Crystal.

Example:

letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
=end

# def prompt(message)
#   puts "=> #{message}"
# end

def letter_count(input)
  # Prompt user for iput
  # prompt('Please enter your string: ') 
  # input = gets.chomp.downcase.chars
  
  # Convert input into lower-case letters then turn input into an array
  input = input.downcase.chars
  
  # Initialize new hash
  char_count = {}
  
  # Iterate through user's input
  for char in input do
    # Check if each element is in the hash?
      # If element (key) is in hash -> Increase the value by 1
      # If element is not in hash -> Add the new element with starting 
      # value at 1
    if char_count.has_key?(char)
      char_count[char] += 1
    else
      char_count[char] = 1
    end
  end
  
  # Print hash to the console
  p char_count
end

letter_count('codewars')

letter_count('activity')

letter_count('arithmetics')
