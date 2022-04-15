s = "abcxcba"
r = "xbacbca"

s = "abcd"
r = "bacd"

s = "facebook"
R = "eafcobok"


def find_encrypted_string(s)
  return s if s.size <= 2
  
  res = ""
  if s.size%2 == 0
    i = (s.size/2 - 1)
    res = s[i] + find_encrypted_string(s[0,i]) + find_encrypted_string(s[i+1, i+1])
  else
    i = s.size / 2
    res = s[i] + find_encrypted_string(s[0,i]) + find_encrypted_string(s[i+1,i])
  end
  
  res
end

# Test
------
      0 1 2 3
  S = a b c d
  i = 4/2 = 2

#Test
----
  
       0 1 2 3 4
  S =  a b c d e
  i = 5/2 = 2

  S = a b
  s = d e
