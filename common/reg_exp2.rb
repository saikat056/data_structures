Input: s = "aa", p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
  
Input: s = "aab", p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
  
Input: s = "ab", p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".
  
Test
----
i:   0 1 2
s = "a a b", p = "c * a * b"
              j:  0 1 2 3 4
i = 0
j = 1

Test
----
Input: s = "aa", p = "a"
i = 1
j = 0

def is_match(s, p)
  return false if p.size < 1 || s.size < 1
  return false if (p.size == 1) && (p[0] == '*')
  
  i = 0
  j = 0
  
  # O(m+n), where m is size of s and n is size of p
  while i < s.size && j < p.size do
    if (s[i] == p[j]) || (p[j] == '.')
      i += 1
      
      break if j+1 == p.size
      
      j += 1 if (p[j+1] != '*')
    else
      j += 1
    end
  end
  
  i == s.size
end

Time
----
m = s.size, n = p.size

T = O(m+n)
  
Test
----
s.size = 2
p.size = 2

        i:  0 1     j: 0 1
Input: s = "a b", p = ". *"
i = 2
j = 0


Test
----
i:   0 1 2
s = "a a b", p = "c * a * b"
              j:  0 1 2 3 4
s.size = 3
p.size = 5

i = 2
j = 4

