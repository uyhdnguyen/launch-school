# One day Spot was playing with the Munster family's home computer 
# and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?

# The family's data got ransacked. Ruby passes in the copy of object_id 
# of each argument to the method. The method stores these object_id's 
# internally in local scoped variables.

# After the copy of object_id of munster hash passed into 
# method mess_with_demographics, the demo_hash points to that object_id. Then
# the object_id's "age" and "gender" were changed. Hence, the return value of the 
# method call is the original hash because munster still points to that hash.