arr = [3, 4, 1, 6, 2]
output = [1, 3, 1, 5, 1]

def count_subarrays(arr)  
  res = Array.new(arr.size) { 0 }
  
  (0..(arr.size-1)).each do |i|
    count  = 1
    
    # left traverse
    if i - 1 >= 0
     (0..(i-1)).reverse_each do |j|
        break if arr[i] < arr[j]
        count += 1
      end
    end
    
    # right traverse
    if i + 1 < arr.size
      ((i+1)..(arr.size - 1)).each do |j|
        break if arr[i] < arr[j]
        count += 1 if arr[i] >= arr[j]
      end
    end
    
    res[i] = count
  end
  
  res
end
