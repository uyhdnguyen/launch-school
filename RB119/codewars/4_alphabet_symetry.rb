=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1
and b is in position 2. In the alphabet, a and b are also in positions 1 and 2.
Notice also that d and e in abode occupy the positions they would occupy in
the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy
their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase.
No spaces.

Good luck!
=end

# Given array of words
def solve(words)
  # Initialize new array for return
  new_array = []

  # Iterate through each word in the given array(after convert them to downcase)
  words.each do |word|
    word = word.downcase
    counter = 0

    # Iterate through each character in word
        # Compare each character in word position to its own position in alphabet
        # If true, increase counter
    word.each_char do |char|
    counter += 1 if word.index(char) == ('a'..'z').to_a.index(char)
    end

    # Push counter to new array then move on to next word
    new_array.push(counter)
  end

  # Return array of the number of letters
  new_array
end

p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
