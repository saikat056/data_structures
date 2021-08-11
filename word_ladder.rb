
class Node
  attr_accessor :word, :neighbors
  
  def initialize(w)
    @word = w
    @neighbors = {}
  end
end

# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  w_hash = {}
  
  word_list << begin_word
  
  word_list.each do |w|
    w_hash[w] = Node.new(w)
  end
  
  word_nodes = w_hash.values
  
  word_nodes.each do |w_n1|
    word_nodes.each do |w_n2|
      next if w_n1 == w_n2
      
      if edit_distance(w_n1, w_n2) == 1
        w_n1.neighbors[w_n2] = true
      end
    end
  end
  
  queue = []
  begin_node = w_hash[begin_word]
  end_node = w_hash[end_word]
  queue.push([begin_node, 0])
  visited = {}
  
  while !queue.empty? do
    node, d = queue.shift
    visited[node] = true
    
    return d+1 if node == end_node
    
    node.neighbors.keys.each do |neighbor|
      queue.push([neighbor, d+1]) unless visited[neighbor]
    end
  end
  
  return 0
end

def edit_distance(w_n1, w_n2)
  count = 0
  
  w_n1.word.size.times do |i|
    count += 1 if w_n1.word[i] != w_n2.word[i]
  end
  
  count
end

