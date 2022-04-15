# kadane's algo on max sub-array
        0   1  2  3  4
arr = [-2, -3, 1, 3, 4]
i = 1
max_sum = -5
max_in = [1, 1]
new_sum = -3

def max_subarray(arr)
  return arr if arr.size < 2
  
  sum = max_sum = -Float::INFINITY
  index = max_in = [0, 0]
  
  (0..(arr.size - 1)).each do |i|
    new_sum = sum + arr[i]
    
    if arr[i] > new_sum
      sum = arr[i]
      index = [i, i]
    else
      sum = new_sum
      index[1] = i
    end
    
    if sum > max_sum
      max_sum = sum
      max_in = index.dup
    end
  end
  
  max_len = max_in[1] - max_in[0] + 1
  
  arr[max_in[0], max_len]
end

Time
----
  T = O(n)
 
Space
-----
  S = o(1)

