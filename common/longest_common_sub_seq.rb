# longest-common-subsequence

X =   "ABCBDAB"
Y =   "BDCABA"
LCS = "BCAB"
LCS = "BDAB"

       i:   1   2   3   4   5   6   7
            A   B   C   B   D   A   B
j:   1  B | 0 | 1 | 0 | 1 | 0 | 0 | 1 
     2  D | 0 | 1 | 1 | 1 | 2 | 2 | 2 
     3  C | 0 | 1 | 2 | 2 | 2 | 2 | 2 
     4  A | 1 | 1 | 2 | 2 | 2 | 3 | 3 
     5  B | 1 | 2 | 2 | 3 | 3 | 3 | 4 
     6  A | 1 | 2 | 2 | 3 | 3 | 4 | 4 
    

     dp[i][j] = [dp[i][j-1], dp[i-1][j], dp[i-1][j-1] + match].max

res = "BCBA"

def lcs(seq1, seq2)
  m = seq1.size
  n = seq2.size
  
  dp = Array.new(m+1) { Array.new(n+1) { 0 }}
  
  (1..m).each do |i|
    (1..n).each do |j|
      match = (seq1[i-1] == seq2[j-1]) ? 1 : 0
      dp[i][j] = [dp[i][j-1], dp[i-1][j], (dp[i-1][j-1] + match)].max
    end
  end
  
  [dp[m][n], solution(dp, seq1, seq2, m, n)]
end

def solution(dp, seq1, seq2, m, n)
  str = ""
  c = dp[m][n]
  i = m
  j = n
  
  while(c > 0) do
    while((dp[i][j] == dp[i-1][j]) && (i >= 0)) do
      i -= 1
    end
  
    while((dp[i][j] == dp[i][j-1]) && (j >= 0)) do
      j -= 1
    end
  
    str = seq1[i-1] + str
    i -= 1
    j -= 1
    c = dp[i][j]
  end
  
  str
end

#Time
m = size of seq1
n = size of seq2
T = O(m*n)
S = O(m*n)


       i:   0   1   2   3   4   5   6
            A   B   C   B   D   A   B
j:   0  B |   |   |   |   |   |   |  
     1  D |   |   |   |   |   |   |  
     2  C |   |   |   |   |   |   |  
     3  A |   |   |   |   |   |   |  
     4  B |   |   |   |   |   |   |  
     5  A |   |   |   |   |   |   |  
