# letter and numbers. We have an array containing letters and numbers. Return the maximum subarray containing equla number of letters and numbers

arr =     [ a, 1, 1, a, b, 2, 1]
l_count = [ 1, 1, 1, 2, 3, 3, 3
n_count = [ 0, 1, 2, 2, 2, 3, 4
                  x  y
arr =     [ a, a, a, 1, a, 1, a, a]
l_count = [ 1, 2, 3, 3, 4, 4, 5, 5]
n_count = [ 0, 0, 0, 1, 1, 2, 2, 2]

def max_subarray(arr)
  hash = {}
  # S = O(n)
  l_count = Array.new(arr.size) { 0 }
  n_count = Array.new(arr.size) { 0 }
  
  max_index = [0, 0]
  
  # T = O(n)
  (0..(arr.size - 1)).each do |i|
     if arr[i] >= '0' && arr[i] <= '9'
        n_count[i] = (i == 0) ? 1 : (n_count[i-1] + 1)
        l_count[i] = l_count[i-1]
     else    
        l_count[i] = (i == 0) ? 1 : (l_count[i-1] + 1)
        n_count[i] = n_count[i-1]
     end
     
     diff = n_count[i] - l_count[i]
     if diff == 0
        max_index = [0, i]
     elsif hash[diff]
        curr_len = i - hash[diff]
        if curr_len > (max_index[1] - max_index[0] + 1)
           max_index = [hash[diff] + 1, i]
        end
     else
        hash[diff] = i
     end
  end
  
  return [] if max_index[0] == max_index[1]
  
  start, stop = [max_index[0], max_index[1]]
  len = stop - start + 1
  arr[start, len]
end

Time
----
  T = O(n)
  n = size of the array
  
Space
-----
  S = O(n)
