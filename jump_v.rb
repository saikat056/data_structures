Input: arr = [6,4,14,6,8,13,9,7,10,6,12], d = 2
Output: 4


def max_jumps(arr, d)
  s_arr = []
  n = arr.size
  
  (0..(n-1)).each do |i|
    s_arr << [arr[i], i]
  end
  
  s_arr.sort_by!{|x| x[0]}
  
  dp = Array.new(n) { 0 }
  
  dp[0] = 1
  
  (1..(n-1)).each do |i|
    dp[i] = 1
    
    (0..(i-1)).each do |j|
      if ((s_arr[j][1] - s_arr[i][1]).abs <= d) && (s_arr[i][0] > s_arr[j][0]) && reach?(arr, s_arr[i][1], s_arr[j][1])
        dp[i] = [dp[i], dp[j] + 1].max
      end
    end
  end
  
  dp.max
end

def reach?(arr, i, j)
  if i > j
    while i > j do
      return false if arr[i] <= arr[j]
      j += 1
    end
  else
    while i < j do
      return false if arr[i] <= arr[j]
      j -= 1
    end
  end
  
  true
end


# Better solution


def max_jumps(arr, d)
  n = arr.size
  dp = Array.new(n) { -1 }
 
  (0..(n-1)).each do |i|
    dfs(arr, d, dp, i)
  end

  dp.max
end

def dfs(arr, d, dp, i)
  return dp[i] if dp[i] != -1
  
  n = arr.size
  
  dp[i] = 1
  
  (1..d).each do |j|
    break if i+j >= n
    break if arr[i] <= arr[i+j]
    dp[i] = [dp[i], 1 + dfs(arr, d, dp, i+j)].max
  end
  
  (1..d).each do |j|
    break if i-j < 0
    break if arr[i] <= arr[i-j]
    dp[i] = [dp[i], 1 + dfs(arr, d, dp, i-j)].max
  end
  
  dp[i]
end
