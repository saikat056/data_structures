
             0,    1,    2,    3
graph = [[1,3],[0,2],[1,3],[0,2]]

queue = [[0,0]]
      = [[2,0],[2,0]]

set_a = {0: true, 2: true}
set_b = {1: true, 3: true} 

 0----1
 |    |
 |    |
 3----2

# @param {Integer[][]} graph
# @return {Boolean}
def is_bipartite(graph)
  return false if graph.empty?
  
  set_a = {}
  set_b = {}
  
  bipartite = true
  
  # O(|V|)
  graph.size.times do |v|
    if set_a[v].nil? && set_b[v].nil?
      bipartite &&= bfs(v, graph, set_a, set_b)
    end
    
    return false unless bipartite
  end
  
  bipartite
end

# O(|E|)
def bfs(v, graph, set_a, set_b)
  queue = []
  queue.push([v, 0])
  
  while !queue.empty? do
    ver = queue.shift
    
    if ver[1] == 0
      return false if set_b[ver[0]]
      
      set_a[ver[0]] = true
      neighbors = graph[ver[0]]
      neighbors.each do |n|
        queue.push([n, 1]) unless set_b[n]
      end
    else
      return false if set_a[ver[0]]
      
      set_b[ver[0]] = true
      neighbors = graph[ver[0]]
      neighbors.each do |n|
        queue.push([n, 0]) unless set_a[n]
      end
    end
  end
  
  return true
end

# Test
graph = []
bipartite = false

             0,    1,    2,    3
graph = [[1,3],[0,2],[1,3],[0,2]]

queue = [[0,0]]
      = [[2,0],[2,0]]

set_a = {0: true, 2: true}
set_b = {1: true, 3: true} 


# Time complexity
T = O(|V| + |E|)
