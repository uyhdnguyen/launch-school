=begin

- PROBLEM
  - Input: array that contains consecutive letters
  - Output: string - represents missing letter

  - Rules:
    - givven an array of consecutive letter
    - the missing letter is always  in the range of given array
    - if given letters are downcase, return value is an uppercased letter
    - else given letters are uppercased letter, return value is a downcased letter
    - return an empty array if given array is empty

- EXAMPLE
  - determine_missing_letter(['a','b','c','d','f']) == 'E'
  - determine_missing_letter(['H','J','K','L']) == 'i'
- DATA STRUCTURE
  - array to process missing letter

- ALGORITHM
  - create an alphabet for reference
    - uppercased alphabet
    - lowercased alphabet
  - if given array contains all lowercased letters
    - use all? method to check if all elements are downcased/uppercased

    - find the reference range from given array in lowercased alphabet
      - get the first and last chars of given array
      
  - else 
    - find the reference range from given array in uppercased alphabet

  - return missing letter
    - reference range - given array
=end

def determine_missing_letter(array)
  # uppercased_alphabet = ("A".."Z")
  # lowercased_alphabet = ("a".."z")
  return [] if array.empty?

  alphabet = (array.first..array.last).to_a

  missing_letter = alphabet - array

  if alphabet.first == alphabet.first.downcase
    missing_letter.first.upcase
  else
    missing_letter.first.downcase
  end
end

p determine_missing_letter(['a','b','c','d','f']) #== 'E'
p determine_missing_letter(['o','q','r','s']) #== 'P'
p determine_missing_letter(['H','J','K','L']) #== 'i'
p determine_missing_letter([]) #== []