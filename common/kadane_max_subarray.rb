arr = [-2, 3, 4, -1, -1, 6, -1]
    i:  0, 1, 2,  3,  4, 5,  6

i = 0,1,2,3,4,5
g_max = 11
cur_max = 10
g_indexes = [1,5]

# kadane
def max_subarray(arr)
  return [0, nil] if arr.empty?
  
  g_max = cur_max = arr[0]
  g_indexes = [0,0]
  
  # O(n)
  (1..(arr.size-1)).each do |i|
    if arr[i] > (arr[i] + cur_max)
      cur_max = arr[i]
      if cur_max > g_max
        g_max = cur_max 
        g_indexes = [i, i]
      end
    else
      cur_max = arr[i] + cur_max
      if cur_max > g_max
        g_max = cur_max 
        g_indexes[1] = i
      end
    end
  end
  
  [g_max, g_indexes]
end

# Time
n = array.size
T = O(n)

# Test 2
arr = [0, 0]
arr = [-1,-1,-1,0,-1,-4]
arr = [4,-2,5,-6,-10,8]
arr = []
arr = [-1,-3,-4]

# Test
arr.size == 0
0

arr = [-2, 3, 4, -1, -1, 6, -1]
    i:  0, 1, 2,  3,  4, 5,  6

i = 0,1,2,3,4,5
g_max = 11
cur_max = 10
g_indexes = [1,5]

# Test 2
