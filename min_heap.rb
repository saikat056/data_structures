# min heap

class Node
  attr_accessor :val
  
  def initialize(v)
    @val = v
  end
end

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
  attr_accessor :val
  
  def initialize(v)
    @val = v
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
