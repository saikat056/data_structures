def falling_squares(positions)
  # S = O(n)
  arr  = Array.new(positions.size) { 0 }
  
  # T = O(n^2)
  (0..(positions.size - 1)).each do |i|
    p = positions[i]
    left_1 = p[0]
    right_1 = p[0] + p[1]
    
    arr[i] += p[1]
    
    ((i+1)..(positions.size - 1)).each do |j|
      p2 = positions[j]
      left_2 = p2[0]
      right_2 = p2[0] + p2[1]
      
      if (left_1 < right_2) && (left_2 < right_1)
        arr[j] = [arr[j], arr[i]].max
      end
    end
  end
  
  (1..(arr.size - 1)).each do |i|
    arr[i] = [arr[i-1], arr[i]].max
  end
   
  arr
end

Time
 T = O(n^2)

Space
 S = O(n)
