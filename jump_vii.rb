
def can_reach(s, min_jump, max_jump)
  n = s.size
  dp = Array.new(n) { false }
  
  dp[0] = true
  
  (0..(n-1)).each do |i|
    next unless dp[i]
    next if s[i] == '1'
      
    (min_jump..max_jump).each do |j|
      break if i+j == n
      
      dp[i+j] = true if s[i+j] == '0'
    end
  end
  
  dp[-1]
end

# Better solution

def can_reach(s, min_jump, max_jump)
  n = s.size
  dp = Array.new(n) { false }
  pre = 0
  
  dp[0] = true
  
  (1..(n-1)).each do |i|
    if (i >= min_jump) && dp[i - min_jump]
      pre += 1
    end
    
    if (i > max_jump) && dp[i - max_jump - 1]
      pre -= 1
    end
    
    dp[i] = (pre > 0) && (s[i] == '0')
  end
  
  dp[-1]
end
