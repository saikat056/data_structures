# write a method to add two numbers without arithmatic operators

Test
----
  a =  101
 +b =   11
  -------- 
      1000
    
  a^b = 101 ^ 011 = 110 = a
  a&b = 101 & 011 = 001 << 1 = 010 = b
  
  a^b = 110 ^ 010 = 100 = a
  a&b = 110 & 010 = 010 << 1 = 100 = b
  
  a^b = 100 ^ 100 = 000 = a
  a&b = 100 & 100 = 100 << 1 = 1000 =b
  
  a^b = 1000 ^ 0000 = 1000 = a
  a&b = 1000 & 0000 = 0000 << 1 = 0000 = b 
        
def add(a, b)
  return a if b == 0
  
  add(a^b, ((a&b)<<1))
end

Time
----
 a = 5 = "101"
 n = 3
 n = size of a bitstring
 T = O(n)
 
 Space
 -----
  call-stack
  S = O(n)
