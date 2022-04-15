#Input: begin_word = "hit", end_word = "cog", word_list = ["hot","dot","dog","lot","log","cog"]
#Output: 5
#Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.

word_hash = { "*it": ["hit"], "h*t": ["hit", "hot"], "hi*": ["hit"]}

def ladder_length(begin_word, end_word, word_list)
  # T = O(m^2 * n)
  word_hash = gen_word_hash(word_list)
  
  b_queue = []
  b_queue.push([begin_word, 0])
  b_visited = {}
  
  e_queue = []
  e_queue.push([end_word, 0])
  e_visited = {}
  
  # T = O(m*n)
  while(!b_queue.empty? && !e_queue.empty?) do
    d = adv_queue(b_queue, b_visited, e_visited, word_hash)
    return d + 1 if d != -1
    
    d = adv_queue(e_queue, e_visited, b_visited, word_hash)
    return d + 1 if d != -1
  end
  
  -1
  
end

def adv_queue(queue, visited, other_visited, word_hash)
  e =  queue.pop
  
  if !other_visited[e[0]].nil?
    return e[1] + other_visited[e[0]]
  end 
    
  visited[e[0]] = e[1]
  
  s = e[0].dup
  
  # T = O(m*n)
  s.size.times do |i|
    c = s[i]
    s[i] = '*'
    
    neighbors = word_hash[s]
    
    if !neighbors.nil?
      neighbors.each do |neighbor|
        queue.push([neighbor, e[1] + 1]) if visited[neighbor].nil?
      end
    end
    
    s[i] = c
  end
  
  return -1
end

def gen_word_hash(word_list)
  word_hash = {}
  
  word_list.each do |w|
    str = w.dup
    
    str.size.times do |i|
      c = str[i]
      str[i] = '*'
      word_hash[str] ||= []
      word_hash[str] << w
      str[i] = c
    end
  end
  
  word_hash
end

Time
----
 T = O(m^2 * n), m = size of each word, n = # of words in the dictionary
 |V| = O(m*n)
 
Space
-----
 |V| = O(m*n)
