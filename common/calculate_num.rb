str = "2*3+5/6*3+15"
 s = "15"
 num_s = [6, 5, 6, 3] 
 op_s  = ['+', '/', '*']
 num_s = [21.2777] 
 op_s  = []
 
def calculate(str)
  num_s = []
  op_s = []
  
  s = ""
  str.chars.each do |c|
    if c >= '0' && c <= '9'
      s += c
    else
      num_s.push(s.to_i)
      s = ""
      
      if op_s.empty?
        op_s.push(c)
      else
        if higher?(c, op_s[-1])
          op_s.push(c)
        else
          collapse(c, num_s, op_s)
        end
      end
    end
  end
  
  num_s.push(s.to_i)
  
  while !op_s.empty? do
    num1 = num_s.pop
    num2 = num_s.pop
    operator = op_s.pop
    
    r = num2.to_f.send(operator.to_sym, num1)
    num_s.push(r)
  end
    
  num_s.pop
end

 num_s = [6, 0.2777] 
 op_s  = ['+',]
 op = '+'
 
def collapse(op, num_s, op_s)
  while !op_s.empty? && !higher?(op, op_s[-1]) do
    num1 = num_s.pop
    num2 = num_s.pop
    operator = op_s.pop
    
    r = num2.to_f.send(operator.to_sym, num1)
    num_s.push(r)
  end
  
  op_s.push(op)
end

def higher?(op1, op2)
  return false if op1 == op2
  return true if (op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-')
  return true if op1 == '/' && op2 == '*'
  return false
end
