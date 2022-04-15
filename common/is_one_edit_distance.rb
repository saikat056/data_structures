Input: s = "ab", t = "acb"
Output: true
Explanation: We can insert 'c' into s to get t.

  
def is_one_edit_distance(s, t)
  s,t = [t, s] if s.size >= t.size
  
  ignore_char_once = false
  
  i = j = 0
  d = t.size - s.size

  return true if s.size == 0 && t.size == 1
  return false if s.size == 0 && t.size == 0
  return false if d >= 2

  while i < s.size do
    if s[i] == t[j]
      i += 1
      j += 1
    else
      i += 1 if s.size == t.size
      j += 1
      
      if ignore_char_once
        return false
      else
        ignore_char_once = true
      end
    end
  end
  
  return true if ignore_char_once
  
  (t.size - s.size) == 1 ? true : false
end

Time complexity
---------------
n = s.size
T = O(n)

Test
----
s = "adb", t = "acbc"

s = "acb", t = "acbc"

s = "ab", t = "acb"

s = "adb", t = "acb"

s = "acb", t = "acb"

s = "", t = ""

s = "a", t = "" -> s = "", t = "a"
