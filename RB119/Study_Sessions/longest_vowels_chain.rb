=begin
ALGORITHM
=========
- find all of the substring
  - iterate through all characters of given string, starting from index 0

  - create length from 1 to length of given string

  - reduce the size of the length

  - return the vowel substrings array

    - select all of the substrings that has vowels
      any? / chars / `substr_arr`

  - select the string that has longest vowels chain

    - create an array for counts
      - `count_arr`

    - create a current count
      `current_count`

    - create a max count
      `max_count`

    - iterate through all substrings of `substr_arr`
      - reset the count to 0

    - iterate through each character of each substring
      - if the character is vowel -> increase the current_count -> max_count = current_count

      - else reset the current_count to 0

    - push the max_count to the count_arr


=end

# def longest_vowels_chain(str)
#   substr_arr = (0...str.size).each_with_object([]) do |idx, substr|
#     (1..str.size - idx).each do |substr_length|
#       substr << str[idx, substr_length] if str[idx, substr_length].chars.any?(/[aeiou]/)
#     end
#   end

#   substr_arr.each_with_object([]) do |sub, count_arr|
#     max_count = 0
#     current_count = 0
#     # 'hellooip'

#     sub.chars.each do |char|
#       if %w(a e i o u).include?(char)
#         current_count += 1
#         max_count = current_count if current_count > max_count
#       else
#         current_count = 0
#       end   
#     end
#     count_arr << max_count
#   end.max
# end

def longest_vowels_chain(str)
  str.split(/[^aeiou]/).map(&:size).max
end


p longest_vowels_chain("codewarriors") == 2
p longest_vowels_chain("suoidea")==3
p longest_vowels_chain("iuuvgheaae")==4
p longest_vowels_chain("ultrarevolutionariees")==3
p longest_vowels_chain("strengthlessnesses")==1
p longest_vowels_chain("cuboideonavicuare")==2
p longest_vowels_chain("chrononhotonthuooaos")==5
p longest_vowels_chain("iiihoovaeaaaoougjyaw")==8