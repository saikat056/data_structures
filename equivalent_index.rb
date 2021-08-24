
# equilibrium index of array

---i:  0  1  2  3  4  5  6
arr = [1, 2, 3, 4, 2, 3, 1]
i = 3
left = 1, 3, 6
right = 16 - 1 = 15, 13, 10, 6
out = 3

def equi(arr)
  return -1 if arr.size < 3
  
  # S = O(1)
  right  = arr.sum - arr[0]
  left = arr[0]
  
  # T= O(n)
  (1..(arr.size - 2)).each do |i|
    right -= arr[i]
    
    return i if left == right
    
    left += arr[i]
  end
  
  return -1
end

Time
----
  T = O(n)
  
Space
-----
  S = O(1)

