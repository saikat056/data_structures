def shortestDist(arr, res)
  dp = Array.new(arr.size) { nil }
  
  (0..(arr.size - 1)).each do |i|
    res.each do |r|
      dp[i] ||= {}
      
      if arr[i][r]
        dp[i][res] = 0 
      else
        if i == 0
          dp[i][res] = Float::INFINITY 
        else
          dp[i][res] = dp[i - 1][res] + 1
        end
      end
    end
  end
  
  (0..(arr.size - 2)).reverse_each do |i|
    res.each do |r|
      dp[i][res] = [dp[i][res], dp[i + 1][res] + 1].min
    end
  end
  
  res_index = 0
  min_so_far = Float::INFINITY
  
  (0..(dp.size - 1)).each do |i|
    a = []
    res.each do |r|
      a << dp[i][r]
    end
    
    max = a.max
    if max < min_so_far
      min_so_far = max
      res_index = i
    end
  end
  
  res_index
end
