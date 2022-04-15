def min_window(s, t)
  return "" if t.empty? || s.empty?
  org_hash = {}
  hash = {}
  mix = nil
  t.chars.each do |c|
    org_hash[c] ||= 0
    org_hash[c] += 1
    hash[c] = 0
    if mix == nil
      mix = c.ord
    else
      mix =  mix ^ c.ord
    end
  end

  curr_mix = nil
  min_str = nil
  min_length = 1000000000
  i = j = 0
  while j < s.size
    if hash[s[j]] != nil
      hash[s[j]] += 1
      if curr_mix == nil
        curr_mix = s[j].ord
      else
        curr_mix = curr_mix ^ s[j].ord if hash[s[j]] == org_hash[s[j]]
      end
    end

    if curr_mix == mix 
      curr_str_len = j - i + 1
      if curr_str_len < min_length
        min_length = curr_str_len
        min_str = s[i..j]
      end

      while curr_mix == mix && i <= j
        if hash[s[i]] != nil
          hash[s[i]] -= 1
          curr_mix = curr_mix ^ s[i].ord if hash[s[i]] == org_hash[s[j]] - 1
        end
        i += 1
      end

      if curr_mix != mix
        str = s[(i-1)..j]
        if str.length < min_length
          min_str = str
          min_length = str.length
        end
      end
    end

    j += 1
  end

  return min_str.nil? ? "" : min_str
end
