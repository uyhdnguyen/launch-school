# Mad libs are a simple game where you create a story template with blanks for
# words. You, or another player, then construct a list of words and place them
# into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!
def prompt(message)
  puts "=> #{message}"
end

def madlibs()
  prompt('Enter a noun:')
  noun = gets.chomp

  prompt('Enter a verb:')
  verb = gets.chomp

  prompt('Enter a adjective:')
  adjective = gets.chomp

  prompt('Enter a adverb:')
  adverb = gets.chomp

  sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hillarious!"
  sentence_2 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hillarious!"
  sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

  prompt([sentence_1, sentence_2, sentence_3].sample)
end

madlibs