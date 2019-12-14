def minilang(string)
  stack = []
  register = 0
  order = string.split
  order.each do |value|
    case
    when value.to_i.to_s == value then register = value.to_i
    when value == 'PUSH' then stack << register
    when value == 'ADD' then register += stack.pop
    when value == 'SUB' then register -= stack.pop
    when value == 'MULT' then register *= stack.pop
    when value == 'DIV' then register = register / stack.pop
    when value == 'MOD' then register = register % stack.pop
    when value == 'POP' then register = stack.pop
    when value == 'PRINT' then puts register
    end
  end    
end

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')