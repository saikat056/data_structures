# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  word_hash = {}
  
  # O(m*n)
  word_list.each do |word|
    # O(n)
    str = word.dup
    
    # O(n)
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
  
  while !queue.empty? do
    cell = queue.shift
    word = cell[0]
    depth = cell[1]
    visited[word] = true  
    
    return depth if word == end_word
    
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
  
  return 0
end

# Time
n = # of chars in each word
m = # of words in word_list
T = O(m*n)
