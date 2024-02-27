=begin

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

PROBLEM
-------
- input: string contains words
- output: new transformed string with same sequence

rules:
- every 2nd characters in every third word
  - convert to uppercase
- others same
- do not check empty string
- every 3rd word 
  - inside the word, all of odd indices -> uppercase

EXAMPLES
--------
'Lorem Ipsum is simply dummy text of the printing'
'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
              *               * *         * * * *

'It is a long established fact that a reader will be distracted'
'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
                           * *         * * *          * * * * *

 'aaA bB c'
 'aaA bB c'
          
DATA STRUCTURES
---------------
- array contains transformed words

ALGORITHM
---------
- transform given string into an array of words
  - `words_arr`
- find every third word in `words_arr`
  - iterating through each word in `words_arr`
    - `map, `with_index`
    - if word is divisible by 3
      - if idx % 3 == 0
      - transform all odd indices into uppercase
- transform result into  string
=end

# def to_weird_case(str)
#   words = str.split

#   words.map!.with_index do |word, i|
#     if (i + 1) % 3 == 0
#       chars = word.chars.map!.with_index do |char, j|
#         if (j + 1) % 2 == 0
#           char.upcase!
#         else
#           char
#         end
#       end
#       chars.join('')
#     else
#       word
#     end
#   end

#   words.join(' ')
# end

def to_weird_case(str)
  words_arr = str.split

  # option 1 ( Calling `step` on range)
  # (Stepping from 2 to the last element, every step = 3)

  # (2...words_arr.size).step(3) do |idx|
  #   words_arr[idx] = words_arr[idx].chars.map.with_index do |chr, i|
  #     if i.odd?
  #       chr.upcase
  #     else
  #       chr
  #     end
  #   end.join
  # end

  # option 2 (Calling step on integer `+-`)
  # (Stepping from 2 to the last element, every step = 3)
  2.step(words_arr.size - 1, 3) do |idx|
    words_arr[idx] = words_arr[idx].chars.map.with_index do |chr, i|
      if i.odd?
        chr.upcase
      else
        chr
      end
    end.join
  end
  words_arr.join ' '
 
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'