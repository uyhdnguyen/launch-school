# # Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# # Whitespace and punctuation shall simply be removed!
# # The input is restricted to contain no numerals and only words containing the english alphabet letters.


def alphabetized(string)
  characters = string.delete('^a-zA-Z').chars

  alphabet = ('a'..'z').to_a

  # alphabet.each_with_object("") do |letter, result|
  #   characters.each do |char|
  #     result << char if char.downcase == letter
  #   end
  # end

  # alphabet.map do |letter|
  #   characters.select do |char|
  #     char.downcase == letter
  #   end
  # end.join

  characters.each_with_index.sort_by { |char, index| [char.downcase, index] }.map(&:first).join
end

p alphabetized("The Holy Bible") #== "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"