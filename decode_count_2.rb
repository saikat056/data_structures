# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.size == 0 || (s[0] == '0')
  return valid_flag_num(s) if (s.size == 1)
  
  dp = Array.new(s.size + 1) { Array.new(s.size + 1) {0} }
  m = s.size + 1
  
  # 1..5
  (1..(m-1)).each do |j|
    dp[1][j] = valid_flag_num(s[j-1,1])
  end
  
  # 1..4
  (1..(m-2)).each do |j|
    dp[2][j] = (dp[1][j] * dp[1][j+1]) + valid_flag_num(s[j-1,2])
  end
  
  (3..(m-1)).each do |i|
    (1..(m-i)).each do |j|
      first_part = mod_num(valid_flag_num(s[j-1,1]) * dp[i-1][j+1])
      sec_part = mod_num(valid_flag_num(s[j-1,2]) * dp[i-2][j+2])
      dp[i][j] = mod_num(first_part + sec_part)
    end
  end
  
  dp[m-1][1]
end

def mod_num(num)
  num % (10**9 + 7)
end

def valid_flag_num(str)
  return 9                            if (str.size == 1) && (str[0] == '*')
  return 15                           if str[0] == '*' && str[1] == '*'
  return 2                            if str[0] == '*' && str[1] <= '6'
  return 1                            if str[0] == '*'
  return 9                            if str[0] == '1' && str[1] == '*'
  return 6                            if str[0] == '2' && str[1] == '*'
  return 0                            if str[1] == '*'
  
  
  num = str.to_i
  return 0 if (str[0] == '0')
  return 0 if (num <= 0) || (num > 26)

  
  return 1
end
