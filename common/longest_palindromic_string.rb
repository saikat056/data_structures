# find the longest palindromic substring
---i:  0 1 2 3 4 5 6
str = "a b c b c b a"
i = 3
s, e = [0,6]
len = 7
max_len = 7
max_in = [0, 6]

def palin(str)
  return str if str.size < 2
  
  max_len = -Float::INFINITY
  max_in = []
  
  # T = O(n^2)
  (0..(str.size - 2)).each do |i|
    s, e = expand(str, i, i)
    len = e - s + 1
    
    if (len > max_len)
      max_len = len
      max_in = [s, e]
    end
    
    s, e = expand(str, i,  i + 1)
    if e > s
      len = e - s + 1
      
      if (len > max_len)
        max_len = len
        max_in = [s, e]
      end
    end
  end
  
  return '' if max_len == -Float::INFINITY
  
  str[max_in[0], max_len]
end

# T = O(n)
def expand(str, s, e)
  while((s >= 0) && (e < str.size) && (str[s] == str[e])) do
    s -= 1
    e += 1
  end
    
  [s + 1, e - 1]
end

Time
----
  T = O(n^2)
  
Space
-----
  S = O(1)

Test
----
---i:  0 1 2 3
str = "a b b a"
i = 1
s, e = [0, 3]
len = 4
max_len = 4
max_in = [0, 3]
