# Kruskal's algo
# Undirected weighted graph

class Node
  attr_accessor :val
  
  def initialize(v)
    @val = v
  end
end

v1 = Node.new(1)
v2 = Node.new(2)
v3 = Node.new(3)
v4 = Node.new(4)
v5 = Node.new(5)
     
          5      4
  +--->v1--->v2 ---> v4 ---+
  |    |              ^    |
  |    | 6            | 7  |
  |    +---->v3 ------+    |
  +----------v5<-----------+
        1           3

vertices = [v1, v2, v3, v4, v5]
edges    = [[v1, v2, 5],
            [v2, v4, 4],
            [v3, v4, 7],
            [v4, v5, 3],
            [v5, v1, 1],
            [v1, v3, 6]]


# edges.sort_by!{ |x| x[2]}
edges    = [[v5, v1, 1], [v4, v5, 3], [v2, v4, 4], [v1, v2, 5], [v1, v3, 6], [v3, v4, 7]]

result = [[v5, v1, 1], [v4, v5, 3], [v2, v4, 4], [v1, v3, 6]]

             v1, v2, v3,  v4, v5
d_set = [-1,  5, 5,   5,  5,  -5 ]

def min_span_tree(edges, vertices)
  return [] if edges.empty? || vertices.empty?
  
  # O(|E| log |E|)
  edges.sort_by!{ |x| x[2]}
  
  # O(|V|)
  d_set = Array.new(vertices.size + 1) { -1 }
  
  result = []
  
  # O(|E|)
  edges.each do |edge|
    v1 = edge[0]
    v2 = edge[1]
    d_set[v1.val] = v1_root = find(d_set, v1)
    d_set[v2.val] = v2_root = find(d_set, v2)
    
    next if v1_root == v2_root
    
    v1_root, v2_root =  [v2_root, v1_root] if (d_set[v1_root] > d_set[v2_root])
    
    d_set[v1_root] += d_set[v2_root]
    d_set[v2_root] = v1_root
    
    result << edge
  end
  
  result
end

def find(d_set, v)
  val = v.val
  while d_set[val] > 0 do
    val = d_set[val]
  end
  
  val
end

# Time
|E| = number of edges
T = O(|E| log |E|)

# Test
edges = []
vertices = []




edges = [[4,5, 10],[5, 8, 5],[4, 6, 4], [6, 8, 1], [8, 3, 10], [7,8,2], [6,7,3], [1,6,3], [1,2,5]]
vertices = [1,2,3,4,5,6,7,8]

def kruskal(edges, vertices)
  h = {}
  
  vertices.each { |v| h[v] = Set[v] }
  
  edges.sort_by! { |x| x[2] }
  
  res = []
  
  edges.each do |e|
    u = e[0]
    v = e[1]
    
    if (h[u] & h[v]).empty?
      s = h[u] | h[v]
      h[u] = h[v] = s
      res << e
    end
  end
  
  res
  
end

