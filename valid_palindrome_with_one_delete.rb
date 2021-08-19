
# Given a string s, return true if the s can be palindrome after deleting at most one character from it.

Input: s = "aba"
Output: true

Input: s = "abca"
Output: true
Explanation: You could delete the character 'c'.
  
def valid_palindrome(s)
  i = 0
  j = s.size - 1
  delete_once = false
  valid_palin = true
 
  # O(n), where n is number of characters in s
  while (i < j) do
    if (s[i] != s[j]) && delete_once
      valid_palin = false 
      break
    end
    
    if s[i] != s[j]
      if s[i+1] == s[j]
        i = i + 1
        delete_once = true
      elsif s[i] == s[j-1]
        j = j - 1
        delete_once = true
      else
        valid_palin = false
        break
      end
    end
    
    i += 1
    j -= 1
  end

  return true if valid_palin

  i = 0
  j = s.size - 1
  delete_once = false

  # O(n), where n is number of characters in s
  while (i < j) do
    return false if (s[i] != s[j]) && delete_once
    
    if s[i] != s[j]
      if s[i] == s[j-1]
        j = j - 1
        delete_once = true
      elsif s[i+1] == s[j]
        i = i + 1
        delete_once = true
      else
        return false
      end
    end
    
    i += 1
    j -= 1
  end

  true
end

Time Complexity
---------------
n = num of chars in s
T = O(n)

Test
----
#3
#1
s = "abcfda"

i           j
->         <- 
a b c f b d a
0 1 2 3 4 5 6
i = 2
j = 3
delete_once = true

#1
s = "abcda"
a b c b d a
0 1 2 3 4 5
i = 1
j = 3
delete_once = true

#2 
s = "abca"
a b c a
0 1 2 3
i = 3
j = 1
