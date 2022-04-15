Given a string num that contains only digits and an integer target, return all possibilities to add the binary operators '+', '-', or '*' between the digits of num so that the resultant expression evaluates to the target value.

Input: num = "123", target = 6
Output: ["1*2*3","1+2+3"]

curr = 1
str = "1"
i = 1
        0 1 2
nums = "1 2 3"
          ^

1+2 = 3
1+23

1 + 2 + 3

Input: num = "232", target = 8
Output: ["2*3+2","2+3*2"]

Input: num = "105", target = 5
Output: ["1*0+5","10-5"]

Input: num = "00", target = 0
Output: ["0*0","0+0","0-0"]

def add_operators(num, target)
  res = []
  dfs(num, 1, num[0], num[0].to_i, res, target, num[0].to_i, false)
  res
end

def dfs(num, i, str, curr, res, target, prev, multi)
  if i == num.size
    res << str if curr == target && (str.include?("+") || str.include?("-") || str.include?("*"))
    return
  end
  
  # No ops
  new_prev = (prev.to_s + num[i]).to_i
  new_value =  multi ? ((prev == 0 ? 0 : (curr/prev)*new_prev)) : ((curr-prev)+new_prev)
  
  dfs(num, i+1, str+num[i], new_value, res, target, new_prev, false)
  
  # '+' op
  new_prev = num[i].to_i
  new_value = curr + new_prev
  
  dfs(num, i+1, str + '+' + num[i], new_value, res, target, new_prev, false)
  
  # '-' op
  new_prev = (num[i].to_i)*(-1)
  new_value = curr + new_prev
  
  dfs(num, i+1, str + '-' + num[i], new_value, res, target, new_prev, false)
  
  # '*' op
  new_prev = num[i].to_i
  new_value = multi ? (curr*new_prev) : (curr-prev)+(prev*new_prev)
  
  dfs(num, i+1, str + '*' + num[i], new_value, res, target, new_prev, true)
end

Time
----
  T = O(4^n)

Space
-----
  S= O(n), stack calls
