Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
  
                  x -->
                  v
nums1 = [ 1 |  3  |  5 ]
        0   1     2    3        

nums2 =   2 |  4  |   6 | 7
                  ^
                  y -->
start = 0
stop = nums1.size - 1
part_x = (start + stop)/2
part_x + part_y = (x + y + 1) / 2

def find_median_sorted_arrays(nums1, nums2)
  nums1, nums2 = [nums2, nums1] if nums1.size > nums2.size
  
  x = nums1.size
  y = nums2.size
  
  start = 0
  stop = x
  
  x_left = x_right = y_left = y_right = -1
  
  while start <= stop do
    part_x = (start + stop)/2
    part_y = ((x + y + 1)/2) -  part_x
    
    x_left  = get_value(nums1, part_x - 1)
    x_right = get_value(nums1, part_x)
    y_left  = get_value(nums2, part_y - 1)
    y_right = get_value(nums2, part_y)
    
    if x_left <= y_right
      if y_left <= x_right
        break
      else
        start = part_x + 1
      end
    else
      stop = part_x - 1
    end
  end
  
  return [x_left, y_left].max if (x + y)%2 == 1
    
  ([x_left, y_left].max + [x_right, y_right].min).to_f/2
end

def get_value(arr, i)
  (i < 0) ? -Float::INFINITY : ((i >= arr.size) ? Float::INFINITY : arr[i])
end

Time
----
  T = O(log(min(m,n)))
