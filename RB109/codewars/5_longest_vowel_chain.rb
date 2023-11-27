=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io.
The longest of these has a length of 2. Given a lowercase string that has
alphabetic characters only and no spaces, return the length of the longest
vowel substring. Vowels are any of aeiou.
=end
VOWELS = ['a','e','i','o','u']

# Version 1

def solve(string)
  string_array = string.split('')

  counter = 0
  result = 0

  string_array.each do |char|
    if VOWELS.include?(char)
      counter += 1
      result = counter if counter > result
    else
      counter = 0
    end
  end

  result
end

# Version 2

def solve_2(string)
  string_array = string.split('')

  counter = 0
  result = []

  string_array.each do |char|
    if VOWELS.include?(char)
      counter += 1
    else
      counter = 0
    end

    result.push(counter)
  end

  result.max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

p solve_2("codewarriors") == 2
p solve_2("suoidea") == 3
p solve_2("iuuvgheaae") == 4
p solve_2("ultrarevolutionariees") == 3
p solve_2("strengthlessnesses") == 1
p solve_2("cuboideonavicuare") == 2
p solve_2("chrononhotonthuooaos") == 5
p solve_2("iiihoovaeaaaoougjyaw") == 8
