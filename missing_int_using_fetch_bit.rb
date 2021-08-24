# find missing number from an array of bit-string. You can only have fetch_ith bit operation


arr = [0,1,2,3,4,5,6,7]

arr = []
missing = 4
0->n 0->7

0's == 1's if n is odd
0's == 1's + 1 if n is even 

col = 2
0 -> 7

Time
-----
  T = n + n/2 + n/4
    = n(1+ 1/2 + 1/4 + ...)
    = O(n)
  
Space
-----
  S = O(log(n)) stack calls

def find_missing(arr, n)    
   size = (Math.log(n,2)).floor + 1
   res = []
   find(arr, res, 0, size)
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

def find(arr, res, col, size)
  return if col == size
  
  zeros = []
  ones = []
  
  arr.each do |num|
    if fetch(num, col) == '0'
       zeros << num
    else
       ones << num
    end
  end
  
  if zeros.size > ones.size
    res.unshift('1')
    find(ones, res, col + 1, size)
  else
    res.unshift('0')
    find(zeros, res, col + 1, size)
  end
end

def fetch(num, col)
  (num & (1 << col)) > 0 ? '1' : '0'
end
