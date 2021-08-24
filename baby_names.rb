# Baby names
# cracking the coding interview
# 17.7

arr = [['john', 10],['jon', 3], ['davis', 2], ['kari', 3], ['johnny', 11], ['carlton', 8], ['carleton', 2], ['jonathan', 9], ['carrie',5]]

syn = [['jonathan', 'john'], ['jon', 'johnny'], ['johnny', 'john'], ['kari', 'carrie'], ['carleton', 'carlton']]

class Node
  attr_accessor :name, :freq, :children
  
  def initialize(name, freq)
    @name = name
    @freq = freq
    @children = []
  end
end

def baby_names(arr, syn)
  hash = {}
  
  arr.each { |e| hash[e[0]] = Node.new(e[0], e[1]) }
  
  syn.each do |e| 
    hash[e[0]].children << hash[e[1]]
    hash[e[1]].children << hash[e[0]]
  end
  
  visited = {}
  r_hash = {}
  
  hash.values.each do |v|
    r_hash[v.name] = dfs(v, visited, 0) unless visited[v]
  end
  
  r_hash
end

def dfs(v, visited, count)
  visited[v] = true
  count += v.freq
  
  v.children.each do |c|
    count = dfs(c, visited, count) unless visited[c]
  end
  
  count
end

Time
----
 T = O(B + P)
 B = # of baby names
 P = # of pairs of synonyms

hash['john'] = Node('john', 10)
hash['jon'] = Node('jon', 3)
