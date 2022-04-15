Input: heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]
Output: 4
Explanation: After the rain, water is trapped between the blocks.
We have two small pounds 1 and 3 units trapped.
The total volume of water trapped is 4.

  
def trap_rain_water(height_map)
  m = height_map.size
  n = height_map.first.size

  left  = Array.new(m) { Array.new(n) { 0 }}
  right = Array.new(m) { Array.new(n) { 0 }}
  front = Array.new(m) { Array.new(n) { 0 }}
  back  = Array.new(m) { Array.new(n) { 0 }}

  
  (0..(m-1)).each do |i|
    max_so_far = -Float::INFINITY
    (0..(n-1)).each do |j|
      max_so_far = [max_so_far, height_map[i][j]].max
      left[i][j] = max_so_far
    end
  end

  
  (0..(m-1)).each do |i|
    max_so_far = -Float::INFINITY
    (0..(n-1)).reverse_each do |j|
      max_so_far = [max_so_far, height_map[i][j]].max
      right[i][j] = max_so_far
    end
  end

  
  (0..(n-1)).each do |j|
    max_so_far = -Float::INFINITY
    (0..(m-1)).each do |i|
      max_so_far = [max_so_far, height_map[i][j]].max
      front[i][j] = max_so_far
    end
  end

  
  (0..(n-1)).each do |j|
    max_so_far = -Float::INFINITY
    (0..(m-1)).reverse_each do |i|
      max_so_far = [max_so_far, height_map[i][j]].max
      back[i][j] = max_so_far
    end
  end

  vol = 0

  (0..(m-1)).each do |i|
    (0..(n-1)).each do |j|
      vol += [left[i][j], right[i][j], front[i][j], back[i][j]].min - height_map[i][j]
    end
  end

  vol
end
