=begin
(https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby)
5 kyu
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you
help him to find out, how many cakes he could bake considering his recipes?
Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the
maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or
200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.
Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

PROBLEM
-------
- input: 2 hashs , one is recipe, the other is ingredent

- output: integer that represents number of cakes

- how many cakes pete could bake with his recipes
- write funtion `cakes`
- recipe is a hash with 
  - ingredents as key
  - weight as value
  - disregard units

EXAMPLES
--------
{flour: 500, sugar: 200, eggs: 1} 
{flour: 1200, sugar: 1200, eggs: 5, milk: 200}
-> return 2 cakes

{apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}
, {sugar: 500, flour: 2000, milk: 2000});

{"flour"=>500, "sugar"=>200, "eggs"=>1}
{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}
-> 2

{"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100}
{"sugar"=>1700, "flour"=>20000,
"milk"=>20000, "oil"=>30000, "cream"=>5000}
-> 11

DATA STRUCTURES
---------------
- An array to hold all of the keys for recipe
- An array to hold all of the keys for ingredients

ALGORITHM
---------
- create an array to hold the numbers of cakes
  `number_of_cakes`
- select all of the pairs in ingredients that are available in recipe
  - iterate through all pairs in recipe
    - check for all of the keys in recipe if they are available in ingredients
      - `available_ingredients`
- find the number of cake from the values of ingredients and recipe
  - iterate through the `avaiable_ingredients`
    - use the weight to divide the weight in recipe
    - return the value to `number_of_cakes`
- return the minimum value
  - min method

=end

def cakes(recipe, ingredients)
  number_of_cakes = []

  return 0 if recipe.keys.count > ingredients.keys.count

  available_ingredients = ingredients.select { |ingredient,_| recipe.has_key?(ingredient)}

  # return 0 unless (recipe.keys - available_ingredients.keys).empty?

  available_ingredients.each do |ingredient,weight| 
    number_of_cakes << weight / recipe[ingredient]
  end

  number_of_cakes.min
end

# def cakes(recipe, available)
#   result = []

#   return 0 if recipe.keys.count > available.keys.count
  
#   recipe.each do |ingredient, amount|
#     if (available[ingredient])
#       result << (available[ingredient]/ amount)
#     # else
#     #   result << 0
#     end
#   end
  
#   result#.min
# end


p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) #== 2

p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000,
"milk"=>20000, "oil"=>30000, "cream"=>5000})# == 11

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},
{"sugar"=>500, "flour"=>2000,"milk"=>2000}) #== 0

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},
{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) #== 0

p cakes({"eggs"=>4, "flour"=>400},{}) #== 0

p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3,
"cream"=>1, "oil"=>1, "milk"=>1}) #== 1
