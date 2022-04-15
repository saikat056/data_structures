# find missing number from an array of bit-string

arr = ['000', 
       '001', 
       '010', 
       '011', 
       '100', 
       '101',
       '110', 
       '111'],

arr = ['000', 
       '001', 
       '010', 
       '011', 
       '100', 
       '110', 
       '111']
        
missing = '101'
0->n 0->7

0's == 1's if n is odd
0's == 1's + 1 if n is even 

col = 2
0 -> 7

Time
-----
  s = size of each string = log(n)
  T = O(log(n)*log(n))
  
Space
-----
  S = O(log(n)) stack calls

def find_missing(arr)
   even = false
   even = true if (arr.size + 1)%2 == 0
    
   col = arr.first.size - 1
   res = []
   find(arr, res, col)
   convert_int(res)
end

def convert_int(arr)
   n = 0
   arr.each do |e|
     if e == '0'
        n = (n << 1) | 0
     else
        n = (n << 1) | 1
     end
   end
   
   n
end

def find(arr, res, col)
  return if col < 0
  
  zeros = []
  ones = []
  
  arr.each do |num|
    if num[col] == '0'
       zeros << num
    else
       ones << num
    end
  end
  
  if zeros.size > ones.size
    res.unshift('1')
    find(ones, res, col - 1)
  else
    res.unshift('0')
    find(zeros, res, col - 1)
  end
end
