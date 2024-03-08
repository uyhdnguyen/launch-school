=begin
19. Title Case

(https://www.codewars.com/kata/5202ef17a402dd033c000009)

6 kyu

A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of

the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word,

which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of

minor words will be given as a string with each word separated by a space. Your function should ignore the case of the

minor words string -- it should behave in the same way even if the case of the minor word string is changed.

PROBLEM
-------
- input: string that is the title
- output: string that is exception

- input can be
  - first letter of the word is upper case
  - exception and all in lower case unless it is the first word
- method `title_case`
- exceptions is in string format
- exceptions is case insensitive

- first word of the title is always capitalized
- if there are exceptions given
  - all of the words in exceptions is in lowercase
- if there are no exceptions give
  - all of the is capitalized

EXAMPLES
--------
'a clash of KINGS'/ 'a an the of'
-> 'A Clash of Kings'

'THE WIND IN THE WILLOWS'/ 'The In'
-> 'The Wind in the Willows'

'the quick brown fox'
-> 'The Quick Brown Fox'

DATA STRUCTURES
---------------
- array contains exceptions words
- array for all of the words in title
- array for new title

ALGORITHM
---------
- create array for all of the words in title
  - title/ map(&:downcase), split
- create array contains exceptions words
  - exceptions/ map(&:downcase), split
- create array for new title
  - new_title/
- create new title as required
  - if there are exeption given
    - iterate through all of words in title
      - capitalize first word and add it new_title
        - each_with_index, index == 0, capitalize
      - capitalize all of the words if they are not in exceptions and add it to new_title
        - capitalize, include?, <<
      - else, return it to new_title
        - <<
    - transform to string & return new_title
      - join(" ")
  - else,
    - capitalize every word
      - map(&:capitalize)
=end

def title_case(title, minor_words = '')
  if minor_words.empty?
    title.split.map(&:capitalize).join(" ")
  else
    title = title.split.map(&:downcase)
    exceptions = minor_words.split.map(&:downcase)

    new_title = []

    title.each_with_index do |word, index|
      if index == 0
        new_title << word.capitalize 
      else
        if exceptions.include?(word)
          new_title << word
        else
          new_title << word.capitalize
        end
      end
    end

    new_title.join (" ")
  end
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'

p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'

p title_case('the quick brown fox') == 'The Quick Brown Fox'
