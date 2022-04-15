Input: s = "eceba", k = 2
Output: 3
Explanation: The substring is "ece" with length 3.
  
Input: s = "aa", k = 1
Output: 2
Explanation: The substring is "aa" with length 2.
  
def length_of_longest_substring_k_distinct(s, k)
  hash = {}
  i = j = 0
  max_len = 0
  dist = 0

  while (j < s.size) do
    if hash[s[j]].nil?
      hash[s[j]] = 1
      dist += 1
    else
      hash[s[j]] += 1
    end
    
    while dist > k do
      hash[s[i]] -= 1
      
      if hash[s[i]] == 0
        hash[s[i]] = nil
        dist -= 1
      end
      
      i += 1
    end
    
    curr_len = j - i + 1
    max_len = [max_len, curr_len].max
    j += 1
  end

  max_len
end

Time complexity
--------------
n = s.size
0 <= j < n
0 <= i < n
T = O(n)

Test
----
Input: s = "ddeefffgggggg", k = 2

Input: s = "eceba", k = 2
 i = 2
 j = 5
 hash['e'] = 1
 hash['c'] = nil
 hash['b'] = 1
 hash['a'] = 1
 dist = 2
 max_len = 3
