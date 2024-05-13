=begin
Complete the method/function so that it converts dash/underscore delimited
words into camel casing. The first word within the output should be capitalized
only if the original word was capitalized (known as Upper Camel Case, also
often referred to as Pascal case). The next words should be always capitalized.

Examples
"the-stealth-warrior" gets converted to "theStealthWarrior"

"The_Stealth_Warrior" gets converted to "TheStealthWarrior"

"The_Stealth-Warrior" gets converted to "TheStealthWarrior"

=end

# def to_camel_case(str)
#   new_str = str.gsub('-', ' ').gsub('_', ' ').split(' ')

#   result = [new_str[0]]
#   1.upto(new_str.length-1) { |index| result << new_str[index].capitalize }

#   result.join
# end

def to_camel_case(str)
  str.gsub('_','-').split('-').each_with_index.map{ |element,i| i == 0 ? x : x.capitalize }.join
end

p to_camel_case("the-stealth-warrior")
p to_camel_case("The_Stealth_Warrior")
p to_camel_case("The_Stealth-Warrior")
