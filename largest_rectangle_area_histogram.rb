Input: heights = [2,1,5,6,2,3]
Output: 10

stack = [2,]

[6, 7, 5, 2, 4, 5, 9, 3]
 0  1. 2. 3  4. 5  6  7
             ^

   [3,7]

stack = [2, 3],[3,7] 

def largest_rectangle_area(heights)
  n = heights.size
  stack = [-1]
  
  max_area = -Float::INFINITY
  
  (0..(n-1)).each do |i|
     while stack[-1] != -1 && (heights[stack[-1]] >= heights[i]) do
       h = heights[stack.pop()]
       w = i - stack[-1] - 1
       max_area = [max_area, h*w].max
     end
      
     stack << i
  end
    
  while stack[-1] != -1 do
    h = heights[stack.pop()]
    w = n - stack[-1] - 1
    max_area = [max_area, h*w].max
  end
    
  max_area
end
