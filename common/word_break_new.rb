Input: s = "catsand", word_dict = ["cats","and","cat"]
Output: true


     i: 1   2   3   4   5    6   7   
        c   a   t   s   a    n   d   
j:1   | f|  f|  f|  f|  f |  f|  f|
j:2   | f|  f|  f|  f|  f |  f|   |   |   |   |
j:3   | t|  f|  f|  f|  t |   |   |   |   |   |
j:4   | t|  f|  f|  f|    |   |   |   |   |   |
j:5   | f|  f|  f|   |    |   |   |   |   |   |
j:6   | f|  f|   |   |    |   |   |   |   |   |
j:7   | t|   |   |   |    |   |   |   |   |   |
  


class Node
  attr_accessor :val, :neighbors, :is_word
  
  def initialize(c)
    @val = c
    @is_word = false
    @neighbors = {}
  end
end

word_dict.each do |w|
    node = trie
    w.chars.each do |c|
      if node.neighbors[c].nil?
        node.neighbors[c] = Node.new(c)
      end
      
      node = node.neighbors[c]
    end
    
    node.is_word = true
  end

# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  wd_hash = {}
  
  word_dict.each do |w|
    wd_hash[w] = true
  end
  
  n = s.size
  dp = Array.new(n+1){Array.new(n+1) {false}}
  
  # O(n^3)
  (1..n).each do |j|
    # O(n^2)
    (1..(n-j+1)).each do |i|      
      # O(n)
      str = s[i-1, j]
      match = (wd_hash[str] == true) ? true : false
      
      # O(n)
      unless match
        (1..j).each do |k|
          match ||= (dp[i][k] && dp[i+k][j-k])
          break if match
        end
      end
      
      dp[i][j] = match
    end
  end
  
  dp[1][n]
end

# Time
n*n matrix

T = O(n^3)
S = O(n^2)

# Test
Input: s = "catsand", wordDict = ["cats","and","cat"]
Output: true

n = 6
dp = 7*7 array
wd_hash = {"cats": true,"and": true,"cat": true}
