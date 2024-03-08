=begin
24. The Hashtag Generator

(https://www.codewars.com/kata/52449b062fb80683ec000024)

5 kyu

The marketing team is spending way too much time typing in hashtags.

Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).

All words must have their first letter capitalized.

If the final result is longer than 140 chars it must return false.

If the input or the result is an empty string it must return false.

Examples

" Hello there thanks for trying my Kata" => "#HelloThereThanksForTryingMyKata"

" Hello World " => "#HelloWorld"

"" => false

PROBLEM
-------
- input: string that needs to be transform to hashtag
- output: string that is transformed & return is false empty string && > 140 size

- start with #
- all words capitalized

- INPUT HAS NO CHARS IN ALPHABETICAL -> return false
- ONLY THE RESULT > 140 chars -> return false
- empty input & return string -> return false

EXAMPLES
--------
"" -> FALSE

" " * 200 -> FALSE

"Do We have A Hashtag" -> "#DoWeHaveAHashtag"

"code" + " " * 140 + "wars"
-> "#CodeWars"

DATA STRUCTURES
---------------
- array for words in given string
- hashtag variable which is a "#"

ALGORITHM
---------
- RETURN false if stringis empty or given string.size > 140
- CREATE hashtag variable which is a "#"
  - hashtag/ "#"
- TRANSFORM given string into array of words
  - words/ split
- TRANSFORM all words in words to capitalize and join them together
  - capitalized_words/ map(&:capitalize), join
- RETURN hashtag concatenate capitalized_words
=end

def generate_hashtag(str)

  str = str.split.map(&:capitalize).join


  if str.size > 139 || str.empty?
    false
  else
    "#" + hashtag
  end
end

# p generate_hashtag("") == false

# p generate_hashtag(" " * 200) == false

# p generate_hashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"

# p generate_hashtag("Codewars") == "#Codewars"

# p generate_hashtag("Codewars Is Nice") == "#CodewarsIsNice"

# p generate_hashtag("Codewars is nice") == "#CodewarsIsNice"

p generate_hashtag("code" + " " * 140 + "wars") #== "#CodeWars"

# p generate_hashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo

# oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false

# p generate_hashtag("a" * 139) == "#A" + "a" * 138

# p generate_hashtag("a" * 140) == false
