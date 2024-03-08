=begin
34. Sherlock on pockets
(https://www.codewars.com/kata/53bb1201392478fefc000746)

6 kyu

Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person

which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an

array of numbers (can be nil or empty array if empty), example:

pockets = {

bob: [1],

tom: [2, 5],

jane: [7]

}

Write amethod which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the

method should return nil.

p find_suspects(pockets, [1, 2]) == [:tom, :jane]

p find_suspects(pockets, [1, 7, 5, 2]) == nil

p find_suspects(pockets, []) == [:bob, :tom, :jane]

p find_suspects(pockets, [7]) == [:bob, :tom]

PROBLEM
-------
- find person(s) which has something not allowed in their pockets
- pockets contents are hashes
  - key is person
  - value is one or more elements in array of numbers
    - array can be  nil or empty array if empty

pockets = {

bob: [1],

tom: [2, 5],

jane: [7]

}

EXAMPLES
--------
(pockets, [1, 2])
-> [:tom, :jane]

(pockets, [])
-> [:bob, :tom, :jane]

(pockets, [7])
-> [:bob, :tom]

DATA STRUCTURES
---------------

ALGORITHM
---------
- create an array contains bad person(s)
  - bad_persons |
- find person who does not have allowed items in their pocket
  - iterating through pockets
    - for each person
      - iterating through their pockets and check if their items are in allowed_list
      - return person to bad_persons
- return bad_persons
=end

# return array of suspects with illegal items in their pockets


def find_suspects(pockets, allowed_items)
  bad_persons = []

  pockets.each do |person, pocket|
    pocket.each do |item|
      bad_persons << person unless allowed_items.include?(item)
    end
  end

  return nil if bad_persons.empty?

  bad_persons.uniq
end

pockets = {

bob: [1],

tom: [2, 5],

jane: [7]

}

p find_suspects(pockets, [1, 2]) == [:tom, :jane]

p find_suspects(pockets, [1, 7, 5, 2]) == nil

p find_suspects(pockets, []) == [:bob, :tom, :jane]

p find_suspects(pockets, [7]) == [:bob, :tom]
