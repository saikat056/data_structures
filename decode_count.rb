Input: s = "226"
Output: 3
Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
  
s = "22610"
  
inx:    1   .   .   .   5
      | 2 | 2 | 6 | 1 | 0
  0   |   |   |   |   |
  1   | 1 | 1 | 1 | 1 | 0
  2   | 2 | 2 | 1 | 1 |
  3   | 3 | 2 | 1 |   |
  4   | 3 | 2 |   |   |
  5   | 3 |   |   |   |

  22 = ["BB", "B B"]
  61 = ["F A"]

  226 = ["B B F", "B Z", "V F"]
  226 = 2,26 --- 22,6
  261 = 2,61 --- 26,1
  610 = 6,10 --- 61,0

  2261 = 2,261 -- 22, 61 -> 2 + 1
  2610 = 2,610 -- 26,10  -> 1 + 1

  22610 = 2,2610 -- 22,610 -> 2 + 1

  dp[i][j] = valid_flag?(s[j-1,1]) * dp[i-1][j+1] 
           + valid_flag?(s[j-1,2]) * dp[i-2][j+2]

# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.size == 0 || (s[0] == '0')
  return valid_flag?(s) if (s.size == 1)
  
  dp = Array.new(s.size + 1) { Array.new(s.size + 1) {0} }
  m = s.size + 1
  
  # 1..5
  (1..(m-1)).each do |j|
    dp[1][j] = valid_flag?(s[j-1,1])
  end
  
  # 1..4
  (1..(m-2)).each do |j|
    dp[2][j] = (dp[1][j] * dp[1][j+1]) + valid_flag?(s[j-1,2])
  end
  
  (3..(m-1)).each do |i|
    (1..(m-i)).each do |j|
      dp[i][j] = (valid_flag?(s[j-1,1]) * dp[i-1][j+1]) + (valid_flag?(s[j-1,2]) * dp[i-2][j+2])
    end
  end
  
  dp[m-1][1]
end

def valid_flag?(str)
  num = str.to_i
  return 0 if (str[0] == '0')
  return 1 if (0 < num) && (num <= 26)
  return 0
end


# Time
m = size of string

T = O(m^2)
S = O(m^2)

# Test
s = ""
s = "12"

  
# Test
s = "22610"
dp = 6*6 array
0,1,2,3,4,5
m = 6

inx:    1   .   .   .   5
      | 2 | 2 | 6 | 1 | 0
  0   | 0 | 0 | 0 | 0 | 0
  1   | 1 | 1 | 1 | 1 | 0
  2   | 2 | 2 | 1 | 1 |
  3   | 3 | 2 | 1 |   |
  4   | 3 | 2 |   |   |
  5   | 3 |   |   |   |
