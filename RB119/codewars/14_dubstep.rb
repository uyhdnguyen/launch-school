=begin
14. Dubstep
(https://www.codewars.com/kata/551dc350bf4e526099000ae5/train/ruby)

6 kyu

Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep music in his performance. Recently,

he has decided to take a couple of old songs and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB). To make the dubstep remix of

this song, Polycarpus inserts a certain number of words "WUB" before the first word of the song (the number may be

zero), after the last word (the number may be zero), and between words (at least one between any pair of neighbouring

words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and

cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out

what was the initial song that Polycarpus remixed. Help Jonny restore the original song.

Input

The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't

exceed 200 characters

Output

Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.

Examples

song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") => WE ARE THE

CHAMPIONS MY FRIEND

PROBLEM
-------
- input: string contains duplicated "WUB" mixed with lyrics
- output: string contains lyrics

- non_empty string
- uppcased letters
- length <= 200 chars
- WUB before the first word can be 0
- WUB after the last word can be 0
- WUB between the word need at least one 

EXAMPLES
--------
"WUB WE WUB ARE WUBWUB THE WUB CHAMPIONS WUB MY WUB FRIEND WUB"
-> WE ARE THE CHAMPIONS MY FRIEND

"A WUB B WUB C"
-> "A B C"

"A WUBWUBWUB B WUBWUBWUB C"
-> "A B C"

DATA STRUCTURES
---------------
- array contain all of the cleaned strings

ALGORITHM
---------
- create array contain all of the cleaned strings
  - `cleaned_strings`
  - `split` select non empty string
- return the lyrics
  - `join` with space as an argument
=end

def song_decoder(str)
  str.split("WUB").select {|word| word != ""}.join(" ")
end

p song_decoder("AWUBBWUBC") == "A B C"

p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"

p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
