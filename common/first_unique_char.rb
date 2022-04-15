def first_uniq_char(s)
  char_hash = {}
  s.chars.each do |c|
    if char_hash[c] == nil
      char_hash[c] = 1
    else
      char_hash[c] += 1
    end
  end

  first_non_dup_char_index = -1
  s.chars.each_with_index do |c, index|
    if char_hash[c] == 1
      first_non_dup_char_index =  index
      break 
    end
  end
  return first_non_dup_char_index
end
