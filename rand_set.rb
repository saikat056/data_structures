# create a set of m integers from a set of n integers
# the initial set may have duplicates?
# or unique values?
# m <= n?

arr = [4,2,3,5]
curr_n = 1 
r - range [0]
r = 0
res = [5,3,2,4] 

def rand_set(arr, m)
  # S = O(n), size of arr
  curr_n = arr.size
  
  res = []
  # O(m)
  m.times do
    r = (rand*curr_n).floor
    
    res << arr[r]
    
    arr[r], arr[curr_n - 1] = [arr[curr_n - 1], arr[r]]
    
    curr_n -= 1
  end
  
  # S = O(m)
  res
end

Time
----
  T = O(m)

Space
-----
  m <= n
  S = O(n)
  additional space = O(m)
