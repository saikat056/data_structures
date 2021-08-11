# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {String[][]}
def find_ladders(begin_word, end_word, word_list)
  word_hash = {}
  
  word_list.each do |word|
    str = word.dup
    
    str.size.times do |i|
      c = str[i]
      str[i] = '*'
      word_hash[str] ||= []
      word_hash[str] << word
      str[i] = c
    end
  end
  
  queue = []
  queue.push([begin_word, 1])
  visited = {}
  
  final_depth = 0
  while !queue.empty? do
    cell = queue.shift
    word = cell[0]
    depth = cell[1]
    visited[word] = true  
    
    break final_depth = depth  if word == end_word
    
    str = word.dup
    
    str.size.times do |i|
      c = str[i]
      str[i] = '*'
      
      if word_hash[str]
        word_hash[str].each do |w|
          queue.push([w, (depth +1)]) unless visited[w]
        end
      end
    
      str[i] = c
    end
  end
  
  result = []
  stack = []
  curr_depth = 1  
  
  return [] if final_depth == 0
    
  stack.push(begin_word)
  bt(begin_word, end_word, curr_depth, final_depth, word_hash, stack, result)
    
  result
end

def bt(word, end_word, curr_depth, final_depth, word_hash, stack, result)
  if (word == end_word) && (curr_depth == final_depth)
    result << stack.dup
  end
    
  str = word.dup
    
  str.size.times do |i|
    c = str[i]
    str[i] = '*'
    
    if word_hash[str]
      word_hash[str].each do |child|
        stack.push(child)
        
        if(curr_depth < final_depth) && (child != word)
          bt(child, end_word, curr_depth + 1, final_depth, word_hash, stack, result)
        end
        
        stack.pop
      end
    end
      
    str[i] = c
  end
end
