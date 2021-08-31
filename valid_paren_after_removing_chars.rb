leetcode: https://leetcode.com/problems/remove-invalid-parentheses/

Input: s = "()())()"
Output: ["(())()","()()()"]

Input: s = "(a)())()"
Output: ["(a())()","(a)()()"]

s  = "(a)())()"
pc(+1, -1)
  i:    0 1 2 3 4 5 6 7
   s = "( a ) ( ) ) ( )"
        ^
   str = "(a)("   
   pc = 1 - 1 + 1 - 1 - 1 
   
   
def remove_invalid_parentheses(s)
  return [""] if s.size < 2
  
  res = []
  
  cal_valid(s, 0, "", res, 0)
  
  res.uniq
end

def cal_valid(s, i, str, res, pc)
  return if pc < 0
  return if pc != 0 && i == s.size
  
  if i == s.size
    return if pc != 0
    
    if res.empty?
      res << str
    else
      if res.first.size < str.size
        res.clear
        res << str
      elsif res.first.size == str.size
        res << str
      end
    end
     
    return
  end
  
  inc = 0
  if (s[i] == '(') || (s[i] == ')')
    inc = (s[i] == '(') ? 1 : -1
    
    cal_valid(s, i+1, str + s[i], res, pc+inc)
    cal_valid(s, i+1, str, res, pc)
  else
    cal_valid(s, i+1, str + s[i], res, pc)
  end
end

Time
----
  each char: take it or leave it
  T = O(2^n), n = s.size
  
Space
-----
  S = res.size = O(2^n)
  
  recursive stack calls = O(n)
  
     0 1 2 3 4 5 6 7
s = "( a ) ( ) ) ( )"
                   ^
str = "(a)()()"
pc = 0
i = 8
i == s.size
res = ["(a)()()", "(a())()"]

a = ")))(a"
