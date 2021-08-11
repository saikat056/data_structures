
# longest-common-substring

seq1 = "ECBDEB"
seq2 = "BCBDA"
LCS = "CBD"

       i:   1   2   3   4   5   6   7
            A   B   C   B   D   A   B
j:   1  B | 0 | 0 | 0 | 0 | 0 | 0 | 0 
     2  C | 0 | 0 | 0 | 0 | 0 | 0 | 0 
     3  B | 0 | 0 | 0 | 0 | 0 | 0 | 0
     4  D | 0 | 0 | 0 | 0 | 0 | 0 | 0
     5  A | 0 | 0 | 0 | 0 | 0 | 0 | 0
     6  C | 0 | 0 | 0 | 0 | 0 | 0 | 0


    dp[][] = dp[i-1][j-1] + match

def lc_str(seq1, seq2)
  m = seq1.size
  n = seq2.size
  
  dp = Array.new(m+1) { Array.new(n+1) { 0 } }
  
  max_len = 0
  seq_1_index = -1
  
  (1..m).each do |i|
    (1..n).each do |j|
      match = (seq1[i-1] == seq2[j-1]) ? 1 : 0
      dp[i][j] = dp[i-1][j-1] + match
      
      if(dp[i][j] > max_len)
        max_len = dp[i][j]
        seq_1_index = i-1
      end
    end
  end
  
  [max_len, seq1[seq_1_index - max_len + 1, max_len]]
end
    
