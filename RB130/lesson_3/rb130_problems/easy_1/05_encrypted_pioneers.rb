# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.
=begin

PROBLEM
-------
- method that deciphers ROT13
- First half of the alphabet is swiched to the second half of the alphabet, and vice versa.

abcdefghijklmnopqrstuvwxyz
NOPQRSTUVWXYZABCDEFGHIJKLM

- input: string that is case sensitive
- output: newstring that is deciphered

EXAMPLES
--------
Nqn Ybirynpr
Ada Lovelace

DATA STRUCTURES
---------------
- input : string

- Array/ String to push the result to

- output: string

ALGORITHM
---------
- create result array
- find the indices of characters of given string in the ROT13 alphabet
  - iterate through each character of given string
    - if current character is not a space
      - convert the character to downcase if current character is upcase and return the index of current character in ROT13 alphabet
      - return the corresponded character in the alphabet
        - if the current character is upcase, return upcase version
        - else, return downcase version
      - push the character to result
    - if current character is a space
      - push the character to result
- return the result
  - join all elements

=end

def decipher_rot13(str)
  alphabet = ("a".."z").to_a
  rot13_alphabet = ("n".."z").to_a + ("a".."m").to_a
                                    
  result = []

  str.each_char do |char|
    unless alphabet.include? char
      result << char
    else
      rot13_idx = rot13_alphabet.index (char.downcase)
      corresponded_char = alphabet[rot13_idx]

      if char == char.upcase
        result << corresponded_char.upcase
      else
        result << corresponded_char
      end
    end
  end

  result.join
end

def rot13(name)
  decoded = name.chars.map do |char|
              case char
              when /[a-m]/i then (char.ord + 13).chr
              when /[m-z]/i then (char.ord - 13).chr
              else char
              end
            end
  decoded.join
end

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

ENCRYPTED_PIONEERS.each { |name| puts decipher_rot13(name)}
