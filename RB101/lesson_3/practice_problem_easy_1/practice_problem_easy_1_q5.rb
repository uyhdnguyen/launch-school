# Programmatically determine if 42 lies between 10 and 100.

def in_range?(number)
    puts (10..100).include?(number)
end

in_range?(42)

# Other method

def cover_in_range?(number)
    puts (10..100).cover?(number)
end

cover_in_range?(42)
