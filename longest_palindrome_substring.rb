def longest_palindrome(s)
  return "" if s == nil || s.size < 1
  global_max_len = 0
  start_index = end_index = 0
  (0..(s.size - 1)).each do |index|
    len1 = expand_around_centre(s, index, index)
    next_index = (index + 1 < s.size) ? index + 1 : index
    len2 = expand_around_centre(s, index, next_index)
    max_len = [len1, len2].max
    if max_len > global_max_len
      global_max_len = max_len
      start_index  = index - ((max_len + 1) / 2) + 1
      end_index = start_index + max_len - 1
    end
  end
  s[start_index, (end_index - start_index + 1)]  
end

def expand_around_centre(s, left, right)
  start = finish = 0
  while(left >= 0 && right < s.size)
    if  s[left] == s[right]
      start = left
      finish = right
    else
      break
    end
    left -= 1
    right += 1
  end
  finish - start + 1
end
