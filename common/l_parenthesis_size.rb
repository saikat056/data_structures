Input: s = "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()".
  
Input: s = ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()".
  
Input: s = ""
Output: 0
 
  j:
       1  2   3  4   5   6
       )  (   )  (   )   )
i: 0 |  |   |   |  |   |   |
   1 | f| f | f | f| f | f |
   2 | f| t | f | t| f |   |
   3 | f| f | f | f|   |   |
   4 | f| t | f |  |   |   |
   5 | f| f |   |  |   |   |
   6 | f|   |   |  |   |   |
  
  s = ") ( ) ( ) )"
       0 1 2 3 4 5

  s = "( ( ) ( ) )"
  s[j-1] == '(' && s[j+i-2] == ')' && dp[i-2][j+1]
  
or 
  s = "( ) ( ( ) )"
  s[j-1] == '(' && s[j] == ')' && dp[i-2][j+2]



# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  return 0 if s.size <= 1
  
  l_paren_size = 0
  m = s.size + 1
  dp = Array.new(m) { Array.new(m) { false } }
  
  # row 0
  (1..(m-1)).each do |j|
    dp[0][j] = true
  end
  
  # row 2
  (1..(m-2)).each do |j|
    dp[2][j] = (s[j-1] == '(') && ( s[j] == ')')
    l_paren_size = 2 if dp[2][j]
  end
  
  # row 3 and up
  (3..(m-1)).each do |i|
    (1..(m-i)).each do |j|
      (2..(i-1)).each do |k|
        inner = dp[k-2][j+1]
        dp[i][j] ||= ((s[j-1] == '(') && (s[j+k-2] == ')') && dp[i-k][j+k]) && inner
      end
      
      dp[i][j] ||= ((s[j-1] == '(') && (s[j+i-2] == ')') && dp[i-2][j+1])
      
      l_paren_size = i if dp[i][j]
    end
  end
  
  l_paren_size
  #dp
end

# Test
 s = ") ( ) ( ) )"
      0 1 2 3 4 5

# Time
m = string size
2-D array of O(m^2)
T = O(m^2)
S = O(m^2)

# Test
 j:
       1  2   3  4   5   6
       )  (   )  (   )   )
i: 0 |  |   |   |  |   |   |
   1 | f| f | f | f| f | f |
   2 | f| t | f | t| f |   |
   3 | f| f | f | f|   |   |
   4 | f| t | f |  |   |   |
   5 | f| f |   |  |   |   |
   6 | f|   |   |  |   |   |
  
m = 7
dp = 7*7 array

# Test
s = ""
s = "("
s = "()"
s = ")("
