
class Minilang
  attr_accessor :register, :stack, :program

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end
  
  def initialize(program)
    @stack = []
    @register = 0
    @program = program
  end

  def eval
    program.split.each do |token|
      if token == token.to_i.to_s
        self.value(token)
      else
        begin
          self.send(token.downcase.to_sym)
        rescue
          puts "Invalid token: #{token}"
          break
        end
      end
    end
  end

  def add
    self.register += stack.pop
  end

  def div
    self.register /= stack.pop
  end  
  
  def mult
    self.register *= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def push
    stack.push(register)
  end


  def pop
    raise EmptyStackError, "Empty Stack" if stack.empty?
    self.register = stack.pop
  end

  def print
    puts register
  end

  def value(token)
    self.register = token.to_i
  end
end

=begin
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5
=end

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12


Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB


Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8


Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

