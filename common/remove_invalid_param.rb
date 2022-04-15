Input: s = "()())()"
Output: ["(())()","()()()"]

Input: s = "(a)())()"
Output: ["(a())()","(a)()()"]

def remove_invalid_parentheses(s)
  return [""] if s.size == 0
  
  res = []
  cal_valid_paren(s, 0, res, "", 0)
  res.uniq
end

def cal_valid_paren(s, i, res, str, ps)
  return if ps < 0
  
  if i == s.size
    if ps == 0
      if res.empty?
        res << str
      else
        if str.size == res.first.size
          res << str
        elsif str.size > res.first.size
          res.clear
          res << str
        end
      end
    end
  elsif (s[i] == '(' || s[i] == ')')
    inc = (s[i] == '(') ? 1 : -1
    cal_valid_paren(s, i+1, res, str + s[i], ps + inc)
    cal_valid_paren(s, i+1, res, str, ps)
  else
    cal_valid_paren(s, i+1, res, str + s[i], ps)
  end
end

Time complexity
---------------
 n = size of s 

 select a char or not
 2 cases per char
 T = O(2^n)

Space
-----
  - stack of recursive function calls
  - one char per recursive function call
  - height of recursive tree

  S = O(n)

Test
=====
s = "(a)())()"
    ( a ) ( ) ) ( )
    0 1 2 3 4 5 6 7
   i = 3
 str = "(a)"
  ps = 0
