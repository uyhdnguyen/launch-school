=begin
# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches and toggle every one of them. You go back to the beginning, and on
# this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
# repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.
# The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.
# The return value is [1, 4, 9].
===============================================================================
- PROBLEM
  - Input: integer number of lights
  - Output: array contains numbered lights on

  - Rules:
    - Explicit:
      - each switch connect to one light
      - every light is off initially
      - first round, toggle every switch -> all lights on
      - second round, toggle even numbered switch -> even numbered light off
      - third round, toggle multiplied of 3 numbered switch
      - fourth round, toggle multiplied of 5 numbered switch
    - Implicit:
      - given n lights -> n rounds
      - each round number will toggle multiplied of the round number switches

- EXAMPLES AND TEST CASES
  - toggle_n_lights(5) == [1, 4]
  - toggle_n_lights(10) == [1, 4, 9]

- DATA STRUCTURE
  - Input: integer
  - Output: array
  - There are 2 values "on" and "off" for each light
  - each light number is unique so the use of hash with light number acts as key and value is either "on" or off

- ALGORITHM
  - initialize varialbe 'result' to a new hash
  - populate result with all lights number with initial value "on"
  - iterate n_th rounds to toggle each switch based on theirs value and round_number
    - "on" -> "off"
    - "off" -> "on"
  - return the result which contains all lights that are "on"
=end
require 'pry'

def toggle_switch(light_num, list_of_lights)
  list_of_lights[light_num] = list_of_lights[light_num] == "on" ? "off" : "on"
end

def toggle_n_lights(number_of_lights)
  result = {}

  # populate 'result' with all lights "on"
  1.upto(number_of_lights) { |light_num| result[light_num] = "on"}

  round_number = 2

  loop do
    result.each {|light_num, _| toggle_switch(light_num, result) if light_num % round_number == 0}

    round_number += 1
    break if round_number > number_of_lights
  end

  result.select {|k,v| v == "on"}.keys
end

p toggle_n_lights(5) == [1, 4]
p toggle_n_lights(10) == [1, 4, 9]