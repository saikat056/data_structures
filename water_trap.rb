Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

Test
----
height = [0,0,0,   2,1,0,1,3,2,5,     3,0]
  
Test
----
height = [1,0,2,1,0,1,3,2,1,2]
  
Area is determined by the tallest bar on left and right. Speciallly, the shorter of the tallest bars on left and right.
  
def trap(height)
  n = height.size
  # S = O(n)
  left  = Array.new(n) { 0 }
  right = Array.new(n) { 0 }
  
  # T = O(n)
  max_so_far = -Float::INFINITY
  (0..(n - 1)).each do |i|
    max_so_far = [max_so_far, height[i]].max
    left[i] = max_so_far
  end
  
  # T = O(n)
  max_so_far = -Float::INFINITY
  (0..(n - 1)).reverse_each do |i|
    max_so_far = [max_so_far, height[i]].max
    right[i] = max_so_far
  end
  
  area = 0
  
  # T = O(n)
  (0..(n - 1)).each do |i|
    area += [left[i], right[i]].min - height[i]
  end
  
  area
end

Time
----
  T = O(n)

Space
-----
  S = O(n)

Test
----
height = [1,0,2,1,0,1,3,2,1,2] 
stack = 1
         b
  b      b 
  b  bb  b
  bbbbbbbb
  012345
  
     b
  b  b
  b  bb
  bbbbbb
  012345
