Input: s = "babad"
Output: "bab"

Input: s = "cbbd"
Output: "bb"

Input: s = "a"
Output: "a"

Input: s = "ac"
Output: "a"
      
       j:
       1  2   3   4   5    
       b  a   b   a   d
i: 0 |  |   |   |   |   |
   1 | t| t | t | t | t |
   2 | f| f | f | f |   |
   3 | t| t | f |   |   |
   4 | f| f |   |   |   |
   5 | f|   |   |   |   |
  
 dp[i][j] = (s[j-1] == s[j+i-2]) && dp[i-2][j+1]
 
 i = 3
 j = 1
 s = [b a b a d]
      0 1 2 3 4

 dp[3][1] = (s[0] == s[2]) && dp[1][2] = ('b' == 'b') && true = true
 dp[3][2] = (s[1] == s[3]) && dp[1][3] = ('a' == 'a') && true = true


       j:
       1  2   3   4   5    
       b  a   b   a   b
i: 0 | f| f | f | f | f |
   1 | t| t | t | t | t |
   2 | f| f | f | f |   |
   3 | t| t | t |   |   |
   4 | f| f |   |   |   |
   5 | t|   |   |   |   |
  
dp[i][j] = (s[j-1] == s[j+i-2]) && dp[i-2][j+1]

i = 5
j = 1
s = [b a b a b]
     0 1 2 3 4
dp[5][1] = (s[0] == s[4]) && dp[3][2] = t && t = t

def longest_palindrome(s)
  return s if s.size <= 1
  
  m = s.size + 1
  dp = Array.new(m){ Array.new(m){ false } }
  
  # row 1 to all true
  (1..(m-1)).each { |j| dp[1][j] = true }
  
  # row 2
  (1..(m-2)).each do |j|
    dp[2][j] = (s[j-1] == s[j])
  end
  
  # row 3 and up
  (3..(m-1)).each do |i|
    (1..(m-i)).each do |j|
      dp[i][j] = (s[j-1] == s[j+i-2]) && dp[i-2][j+1]
    end
  end
  
  i, j = find_longest(dp)
  
  s[j-1, i]
end

def find_longest(dp)
  m = dp.size
  
  (1..(m-1)).reverse_each do |i|
    (1..(m-1)).each do |j|
      return [i, j] if dp[i][j]
    end
  end
  
  [1, 1]
end

# Time
m = size of the string
2-d array of size O(m^2)
T = O(m^2)
S = O(m^2)

# Test
s = "b"
s = "abc"
      j:
       1  2   3     
       a  b   c
i: 0 | f| f | f 
   1 | t| t | t 
   2 | f| f |  
   3 | f|

# Test
      j:
       1  2   3   4   5    
       b  a   b   a   b
i: 0 | f| f | f | f | f |
   1 | t| t | t | t | t |
   2 | f| f | f | f |   |
   3 | t| t | t |   |   |
   4 | f| f |   |   |   |
   5 | t|   |   |   |   |
  

s = [b a b a b]
     0 1 2 3 4
m = s.size + 1 = 6
dp = 6*6 = all false

