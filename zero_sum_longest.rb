def zero_sum(arr)
  hash_sum = {}
  sum = 0
  max_arr = []
  arr.each_with_index do |elem, index|
    sum += elem
    if sum == 0
      a = arr[0..index]
      max_arr = a if a.size > max_arr.size
    elsif hash_sum[sum]
      prev = hash_sum[sum]
      a = arr[(prev+1)..index]
      max_arr = a if a.size > max_arr.size
    end
    hash_sum[sum] = index
  end
  return max_arr
end

arr=[1,2,3,-3,-2, 4,5]
puts "Zero-sum array:"
print zero_sum(arr)
