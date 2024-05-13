=begin
65. Reversing and Combining Text

(https://www.codewars.com/kata/56b861671d36bb0aa8000819/train/ruby)

Your task is to Reverse and Combine Words.

Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third with fourth and so on...

(odd number of words => last one stays alone, but has to be reversed too)

2. Start it again until there's only one word without spaces

3. Return your result…

PROBLEM
-------
- REVERSE AND COMBINE WORDS
- input: string contains words separated by spaces

- if there more than 1 word
  - reverse each word
  - combine 
    - the first with 2nd
    - 3rd with 4th
    -...
- if given string has odd number of words
  - last stay alone
  - but must be reversed
- loop until there are only one word without spaces
- no empty inputs

EXAMPLES
--------
"abc def"
- 1   2  
- cba fed

- cbafed

-> "cbafed"

"abc def ghi jkl"
- cba fed ihg lkj [1, 2, 3, 4]
    1  2   3   4
- cbafed ihglkj   [12 34]

- defabc jklghi   [1234]
      1    2

- defabcjklghi

-> "defabcjklghi"

"dfghrtcbafed"

-> "defabcjklghi"

DATA STRUCTURES
---------------
- array contains all of the words

ALGORITHM
---------
- create the loop until size of words is 1
  - transform given string into array contains all of the words
    - `words`
  - reverse each word in words
  - group first and 2nd, third and fourth, ....
    - call step method on 0 (from 0 -> words.size - 2)
    - slice method

  - reassign words to the result from 71-74
- return the words array
  - join
=end

def reverse_and_combine_text(str)
  return str if str.split.size == 1

  words = str.split.map(&:reverse)

  result = []

  0.step(words.size - 1, 2) {|idx| result << words[idx, 2]}

  str = result.map(&:join).join(" ")

  reverse_and_combine_text(str)
end



# def reverse_and_combine_text(str)
#   return str if str.split.size == 1

#   words = str.split

#   reversed_words = words.map {|word| word.reverse}

#   new_words = []

#   counter = 0

#   while counter < words.size
#     new_words << reversed_words[counter..counter + 1].join
#     counter += 2
#   end

#   reverse_and_combine_text(new_words.join(' '))

# end


p reverse_and_combine_text("abc def") == "cbafed"

p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"

p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"

p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") ==

"trzwqfdstrteettr45hh4325543544hjhjh21lllll"

p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"