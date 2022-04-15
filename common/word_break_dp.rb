def word_break(s, word_dict)
  return false if s == "" || word_dict.size == 0
  word_dict_hash = {}
  word_dict.each { |word| word_dict_hash[word] = true  }
  word_dict_hash[""] = true
  breakable_word_hash = {}
  is_breakable(s, word_dict_hash, breakable_word_hash)
end

def is_breakable(s, word_dict_hash, breakable_word_hash)
  return word_dict_hash[s] if word_dict_hash[s] != nil
  return breakable_word_hash[s] if breakable_word_hash[s] != nil
  str_length = s.size
  breakable_word_hash[s] = false
  (0..(str_length - 1)).each do |split_index|
    if is_splitted_word_breakable(s, split_index, word_dict_hash, breakable_word_hash)
      breakable_word_hash[s] = true
      return  breakable_word_hash[s]
    end
  end
  return breakable_word_hash[s]
end

def is_splitted_word_breakable(s, split_index, word_dict_hash, breakable_word_hash)
  str_length = s.size
  str1 = s[0, split_index]
  str2 = s[split_index, str_length - split_index]
  is_breakable(str1, word_dict_hash, breakable_word_hash) && is_breakable(str2, word_dict_hash, breakable_word_hash)
end

