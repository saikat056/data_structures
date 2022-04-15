# @param {String} s
# @return {Boolean}
def is_number(s)
  seen_digit = seen_ex = seen_dot = false
    
  (0..(s.size - 1)).each do |i|
     if is_digit?(s[i])
       seen_digit = true
     elsif s[i] == '+' || s[i] == '-'
       if i > 0
         return false if s[i-1] != 'e' && s[i-1] != 'E'
       end
     elsif s[i] == 'e' || s[i] == 'E'
       return false if !seen_digit
       return false if seen_ex
       seen_ex = true
       seen_digit = false
     elsif s[i] == '.'
        return false if seen_ex || seen_dot
        seen_dot = true
     else
        return false
     end
  end
    
  seen_digit
end
  
def is_digit?(c)
  c >= '0' && c <= '9'
end
