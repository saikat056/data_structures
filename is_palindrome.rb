Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
  
a m a n a p l a n a c a n alpanama
0 1 2 3 4

def is_palindrome(s)
  s.downcase!
  
  i = 0
  j = s.size - 1
 
  # O(n), n is number of chars in s
  while i < j do
    while invalid_alpha_num?(s[i]) && (i < j) do
      i += 1
    end
    return false if i > j
    
    while invalid_alpha_num?(s[j]) && (i < j) do
      j -= 1
    end
    return false if i > j
    
    return false if s[i] != s[j]
    i += 1
    j -= 1
  end

  true
end

def invalid_alpha_num?(c)
  !((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9'))
end

Time complexity
===============
n = number of chars in s
T = O(n)

Test
----
a , m a
0 1 2 3
i = 2
j = 2

i         j
->       <-
a , m m : a
0 1 2 3 4 5
i=3
j=2
