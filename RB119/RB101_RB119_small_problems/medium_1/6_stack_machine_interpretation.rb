
=begin

- PROBLEM
  - Input: 
  - Output: 

  - Rules:
    - Explicit:
      - given STACK & REGISTER
      - REGISTER is initialized to 0
      - Number n -> add value n to REGISTER
      - PUSH -> value from REGISTER(push & keep) -> STACK
      - ADD -> value from STACK (pop) -> + value of REGISTER (keep result)
      - SUB -> value from STACK (pop) -> - value of REGISTER (keep result)
      - MULT -> value from STACK (pop) -> * value of REGISTER (keep result)
      - DIV -> value from STACK (pop) -> / value of REGISTER (keep result)
      - MOD -> value from STACK (pop) -> / value of REGISTER (keep result) remainder
      - POP -> value from STACK (pop) -> move to REGISTER (keep result)
      - PRINT

    - Implicit:
      - 

- EXAMPLES AND TEST CASES
  - minilang('5 PUSH 3 MULT PRINT')
  - minilang('5 PRINT PUSH 3 PRINT ADD PRINT')

- DATA STRUCTURE
  - Input: string of commands
  - Output: integers
  - Array

- ALGORITHM
  - convert string into an commands_array which store each command orderly
  - iterate through the array and perform specific command
=end

def minilang(string_commands)
  stack = []
  register = 0

  arr_commands = string_commands.split

  arr_commands.each do |command|
    case command
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack << register
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = command.to_i
    end
  end
end

minilang('PRINT')
# 0
puts "------------------------------------------------------------------------"

minilang('5 PUSH 3 MULT PRINT')
# 15
puts "------------------------------------------------------------------------"

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts "------------------------------------------------------------------------"

minilang('5 PUSH POP PRINT')
# 5
puts "------------------------------------------------------------------------"

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts "------------------------------------------------------------------------"

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts "------------------------------------------------------------------------"

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts "------------------------------------------------------------------------"

minilang('-3 PUSH 5 SUB PRINT')
# 8
puts "------------------------------------------------------------------------"

minilang('6 PUSH')
# (nothing printed; no PRINT commands)