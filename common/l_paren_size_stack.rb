s= ["( ) ( ) ) ) ( )"]
     0 1 2 3 4 5 6 7

stack = [0,0]
max_len = -Float::INFINITY


s="( ( ) ( )"
   0 1 2 3 4

i = 4
stack = [-1, 0, -4]
index = 3
len = 4 - 3 + 1 = 2


s="( ( ) ( ) )"
   0 1 2 3 4 5

i = 4
stack = [-1, 0]
index = 3
len = 4 - 3 + 1 = 2

s=")))))))()"
stack=[]

s="( ( ( ) ) )"
   0 1 2 3 4 5
i = 5
stack=[-6]
index = 0
len = 6
max_len = 6

s = "( ) )"
     0 1 2
i=2
stack=[]
index=
len = 
max_len = 2

s="( ) ( ) ( )"
   0 1 2 3 4 5
i=3
stack=[-2]
index=2
len = 2
max_len = 2 

# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  return 0 if s.size <= 1
  
  stack = []
  
  ch = s.chars
  max_len = -Float::INFINITY
  
  (0..(ch.size-1)).each do |i|
    if ch[i] == '('
      stack.push(-1) if stack.size == 0
      stack.push(i)
    else
      next if stack.empty?
      
      stack.pop if stack.last < 0
      
      next if stack.empty?
        
      if(s[stack.last] == '(')
        index = stack.pop
        len = i - index + 1
        
        if stack.last >= 0 
          stack.push(-(len + 1))
        else
          len = len - stack.pop - 1
          stack.push(-(len + 1))
        end
        
        max_len = [max_len, len].max
      end
    end
  end
  
  max_len < 0 ? 0 : max_len
end

# Time
n = number of chars in string
n = pushes + pop = worst-case
T = O(n)
S = O(n)  

s = "(((((((((((((((((((("
# Test 2
s = "(((((((((("

# Test 1
s= ["( ) ( ) ) ) ( )"]
     0 1 2 3 4 5 6 7

i = 7
index = 6
len = 7-6+1 + 0 = 2
stack = [2]
max_len = 4
