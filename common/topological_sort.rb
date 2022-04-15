class Node
  attr_accessor :val, :neighbours
  
  def initialize(v, n)
    @val = v
    @neighbours = n.nil? ? [] : n
  end
end


    1 --> 2 --> 4
    |           ^
    |           |
    +---> 3 ----+
          |
          +----->5


vertices = [Node.new(1, nil), Node.new(2, nil), Node.new(3, nil), Node.new(4,nil), Node.new(5,nil)]

vertices[0].neighbours = [vertices[1], vertices[2]]
vertices[1].neighbours = [vertices[3]]
vertices[2].neighbours = [vertices[3], vertices[4]]
  
def topo_sort(vertices)
  topo = []
  visited = {}
  
  # O(|V|)
  vertices.each do |vertex|
    dfs(vertex, topo, visited)
  end
  
  topo
end

def dfs(vertex, topo, visited)
  return if visited[vertex]
  
  visited[vertex] = true
  
  # Total O(|E|)
  vertex.neighbours.each do |n|
    dfs(n, topo, visited) unless visited[n]
  end
  
  topo.unshift(vertex)
end

# Time/Space complexity
T = O(|V| + |E|)

call-stack size(worst case) = O(|V|)
vertices array = O(|V|)
S = O(|V|)

1-->2-->3-->4-->5

#Test

    1 --> 2 --> 4
    |           ^
    |           |
    +---> 3 ----+
          |
          +----->5

vertices = [1,2,3,4,5]
topo = [1,3,5,2,4]
visited = {1: true, 2: true, 4: true, 3: true, 5: true}

# Test Edge case
vertice = [1, 2, 3]
   1  2 --> 3
