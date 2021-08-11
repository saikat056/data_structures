
# @param {String[]} words
# @return {String}
class Trie
  attr_accessor :val, :children, :hash, :last, :is_word
  
  def initialize(v)
    @val = v
    @children = []
    @hash = {}
    @last = nil
    @is_word = false
  end
end

class Node
  attr_accessor :val, :neighbours
  
  def initialize(v)
    @val = v
    @neighbours = []
  end
end

def alien_order(words)
  vertices = create_adj_graph(create_trie(words), words)
  
  return "" if vertices.values.empty?
  
  has_cycle?(vertices.values) ? "" : topo_sort(vertices.values)
end

def has_cycle?(vertices)
  white = {}
  gray = {}
  black = {}
  
  vertices.each { |v| white[v] = true }
  
  vertices.each do |v|
    if white[v]
      return true if dfs_cycle(v, white, gray, black)
    end
  end
  
  false
end

def dfs_cycle(node, white, gray, black)
  white[node] = false
  gray[node] = true
  
  node.neighbours.each do |n|
    return true if gray[n]
    
    if white[n]
      return true if dfs_cycle(n, white, gray, black) 
    end
  end
  gray[node] = false
  black[node] = true
  
  false
end

def topo_sort(vertices)
  visited = {}
  arr = []
  
  vertices.each do |v|
    dfs(v, arr, visited) unless visited[v]
  end
  
  arr.inject("") { |memo, elem| memo += elem.val }
end

def dfs(node, arr, visited)  
  node.neighbours.each { |n| dfs(n, arr, visited) }
  
  arr.unshift(node) unless visited[node]
  visited[node] = true
end

#Input: words = ["wrt","wrf","er","ett","rftt"]
#Output: "wertf"
#            nil
#           /  |  \
#          w   e   r
#        /    /  \  |
#       r     r  t  f
#      / \       |  |
#     t  f       t  t
#                   |
#                   t
# class Trie
#   attr_accessor :val, :children, :hash
#  
#   def initialize(v)
#     @val = v
#     @children = []
#     @hash = {}
#   end
# end

def create_trie(words)
  root_trie = Trie.new(nil)
  
  words.each do |word|
    node = root_trie
    word.split('').each do |letter|
      if node.hash[letter]
        if node.last != letter
          return nil
        end
      else
        node.hash[letter] = Trie.new(letter)
        node.children << node.hash[letter]
      end
      
      node.last = letter
      node = node.hash[letter]
    end
      
    return nil if node.children.size != 0
      
    node.is_word = true
  end
  
  root_trie
end

#            nil
#           /  |  \
#          w   e   r
#        /    /  \  |
#       r     r  t  f
#      / \       |  |
#     t  f       t  t
#                   |
#                   t
# class Node
#   attr_accessor :val, :neighbours
#   
#   def initialize(v)
#     @val = v
#     @neighbours = []
#   end
# end

def create_adj_graph(trie, words)
  return {} if trie.nil?
  
  vertices = create_vertices(words)
   
  queue = []
  queue << trie
  
  while !queue.empty? do
    node = queue.shift
    children = node.children
    
    if children.size == 1
      vertices[children[0].val]   ||= Node.new(children[0].val)
    else
      (0..(children.size - 2)).each do |i|
        first_node = vertices[children[i].val]
        sec_node   = vertices[children[i+1].val]
        first_node.neighbours << sec_node
        first_node.neighbours.uniq!
      end
    end
    
    children.each { |child| queue << child }
  end
  
  vertices
end

def create_vertices(words)
  vertices = {}
  
  words.each do |word|
    word.split("").each do |letter|
      vertices[letter] ||=  Node.new(letter)
    end
  end
  
  vertices
end
