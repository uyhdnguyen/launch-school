# Write a method that will take a short line of text, and print it within a box.

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# def print_in_box(text)
#   border_line = "+" + "-" * (text.size + 2) + "+"
#   empty_line = "|" + " " * (text.size + 2) + "|"
#   text_line = "| #{text} |"

#   puts border_line
#   puts empty_line
#   puts text_line
#   puts empty_line
#   puts border_line
# end

# print_in_box ('To boldly go where no one has gone before.')

# Modify this method so it will truncate the message if it will be too wide to
# fit inside a standard terminal window (80 columns, including the sides of the
# box). For a real challenge, try word wrapping very long messages so they appear
# on multiple lines, but still within a box.

# def print_in_box2(text)
#   border_line = "+" + "-" * (text.size + 2) + "+"
#   empty_line = "|" + " " * (text.size + 2) + "|"
#   text_line =<<~HEREDOC #{text}
#   HEREDOC

#   puts border_line
#   puts empty_line
#   puts text_line
#   puts empty_line
#   puts border_line
# end

=begin

- PROBLEM
  - Input: string longer than 80 characters
  - Output: truncated string

  - Rules:
    - Explicit:
      - string can be longer or shorter than 80 characters
      - create a box to cover the string
    - Implicit:
      - string need to be spliced at the whole word
      -

- EXAMPLES AND TEST CASES
  -

- DATA STRUCTURE
  - Input:
  - Output:
  - Array? Hash? Combination?

- ALGORITHM
  -

=end

HORIZONTAL_TEXT = "+--+"
VERTICAL_TEXT = "|"

LOREM_IPSUM = "Lorem Ipsum is simply dummy text of the printing and typesetting
industry. Lorem Ipsum has been the industry's standard dummy text ever since
the 1500s, when an unknown printer took a galley of type and scrambled it to
make a type specimen book. It has survived not only five centuries, but also
the leap into electronic typesetting, remaining essentially unchanged. It was
popularised in the 1960s with the release of Letraset sheets containing Lorem
Ipsum passages, and more recently with desktop publishing software like Aldus
PageMaker including versions of Lorem Ipsum."

MAX_TEXT_LENGTH = 76


def print_in_box_3(text)
  result = []
  cached_result = []
  cached_word_position = 0

  original_text = text.split(" ")

end

print_in_box_3(LOREM_IPSUM)