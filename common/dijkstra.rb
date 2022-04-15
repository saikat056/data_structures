# min heap

index  =         0, 1, 2, 3, 4, 5, 6, 7 
arr    =      [nil, 4, 3, 2, 7, 8, 5,10]
arr    =      [nil, 2, 3, 4, 7, 8, 5,10]


lowest = 3

              2  <---- heapify
            /     \
           3       4  <--- heapify
         /   \   /  \
         7    8  5   10 

arr[parent(i)] <= arr[i]

class Node
  attr_accessor :val, :pre
  
  def initialize(n, v)
    @name = n
    @val = v
    @pre = nil
  end
end

class MinHeap
  def initialize
    @arr = [nil]
    @hash = {}
  end
  
  def min_node
    return nil if @arr.size <= 1
    
    @arr[1]
  end
  
  def extract_min
    return nil if @arr.size <= 1
    
    min  = @arr[1]
    @arr[1], @arr[@arr.size - 1] = [@arr[@arr.size - 1], @arr[1]]
    @hash[@arr[1]] = 1
    @hash[@arr[@arr.size - 1]] = nil
    @arr.pop
    min_heapify(1)
    
    min
  end
  
  def insert(node)
    val = node.val
    node.val = Float::INFINITY
    @arr << node
    @hash[node] = @arr.size - 1
    
    decrease_val(node, val)
  end
  
  def empty?
    @arr.size <= 1
  end
  
  private
  
  def parent(i)
    i/2
  end
  
  def left(i)
    2 * i
  end
  
  def right(i)
    (2 * i) + 1
  end
  
  def min_heapify(i)
    lowest = i
    lowest = (@arr[i].val <= @arr[left(i)].val) ? i : left(i) if left(i) < @arr.size
    lowest = (@arr[lowest].val <= @arr[right(i)].val) ? lowest : right(i) if right(i) < @arr.size
    
    if(lowest != i)
      @arr[i], @arr[lowest] = [@arr[lowest], @arr[i]]
      @hash[@arr[i]] = i
      @hash[@arr[lowest]] = lowest
      min_heapify(lowest)
    end
  end
  
  def decrease_val(node, val)
    return 'val is greater than node->val' if val > node.val
    
    node.val = val
    index  = @hash[node]
    
    while (index > 1) && (@arr[parent(index)].val > @arr[index].val) do
      index = parent(index)
      min_heapify(index)
    end
  end
end

v1 = Node.new(1,0)
v2 = Node.new(2,Float::INFINITY)
v3 = Node.new(3,Float::INFINITY)
v4 = Node.new(4,Float::INFINITY)
v5 = Node.new(5,Float::INFINITY)

vertices = [v1,v2,v3,v4,v5]
edges = {}
edges[v1] = [[v3,10],[v2,5]]
edges[v2] = [[v4,20],[v5,1]]
edges[v3] = [[v4,1]]
edges[v4] = [[v5,30]]

# dag(diected acyclic graph)
def dijkstra(source, edges)
  heap = MinHeap.new
  heap.insert(source)
  visited = {}
  
  
  while !heap.empty? do
    node = heap.extract_min
    visited[node] = true
    neighbours = edges[node]
    
    next if neighbours.nil?
    
    neighbours.each do |neighbour|
      n, cost = [neighbour[0], neighbour[1]]
      if n.val > (cost + node.val)
        n.val = cost + node.val
        n.pre = node
      end
      
      heap.insert(n) unless visited[n]
    end
  end
end


v1 = Node.new(1,0)
v2 = Node.new(2,Float::INFINITY)
v3 = Node.new(3,Float::INFINITY)
v4 = Node.new(4,Float::INFINITY)
v5 = Node.new(5,Float::INFINITY)

vertices = [v1,v2,v3,v4,v5]
edges = {}
edges[v1] = [[v2,10],[v3,5]]
edges[v2] = [[v3,2],[v4,1]]
edges[v3] = [[v2,3],[v4,9],[v5,2]]
edges[v4] = [[v5,4]]
edges[v5] = [[v4,6],[v1,7]]
