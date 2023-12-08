# Given a string that consists of some words (all lowercased) and an
# assortment of non-alphabetic characters, write a method that returns
# that string with all of the non-alphabetic characters replaced by spaces.
# If one or more non-alphabetic characters occur in a row, you should only have
# one space in the result (the result should never have consecutive spaces).

# Examples:
# cleanup("---what's my +*& line?") == ' what s my line '

# Solution 1
def cleanup(string)
  result = []
  #Iterate through the whole string and replace non-alphabetic chars with space
  string = string.chars.map do |char|
    if char.match(/\A[a-zA-Z]*\z/)
      result.push(char)
    else
      result.push(char = ' ') unless result[-1] == ' ' # check if last char is
                                                   # a space
    end
  end
  #
  result.join
end

# Solution 2
ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

# Solution 3
def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?")
