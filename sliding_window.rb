# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
class Node
  attr_accessor :val

  def initialize(v)
    @val = v
  end
end

class MaxHeap1
  def initialize
    @arr = [nil]
    @hash = {}
    @v_to_node = {}
  end

  def push(v)
    insert(Node.new(v))
  end

  alias_method :<<, :push

  def max
    return nil if @arr.size <= 1

    @arr[1].val
  end

  def max_node
    return nil if @arr.size <= 1
    
    @arr[1]
  end
  
  def size
    @arr.size - 1
  end
  
  def empty?
    size == 0
  end
  
  def pop
    return nil if @arr.size <= 1
    
    max  = @arr[1]
    @arr[1], @arr[-1] = [@arr[- 1], @arr[1]]
    @hash[@arr[1]] = 1
    @hash.delete(max)
    @arr.pop
    @v_to_node[max.val].delete(max)


    if @v_to_node[max.val].empty?
      @v_to_node.delete(max.val)
    end

    max_heapify(1) if size > 0
    
    max.val
  end

  def delete(val)
    return nil if @v_to_node[val].nil? || @v_to_node[val].empty?

    node = @v_to_node[val].pop

    if @v_to_node[val].empty?
      @v_to_node.delete(val)
    end

    return nil if node.nil?

    index = @hash[node]

    @arr[index], @arr[-1] = [@arr[- 1], @arr[index]]
    @hash[@arr[index]] = index
    @hash.delete(node)
    @arr.pop

    max_heapify(1) if size > 0

    node.val
  end

  def insert(node)
    val = node.val.dup

    if val.is_a?(Array)
      node.val[0] = -Float::INFINITY
    else
      node.val = -Float::INFINITY
    end

    @arr << node
    @hash[node] = @arr.size - 1
    
    increase_val(node, val)
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
  
  def max_heapify(i)
    highest = i

    if @arr[i].val.is_a?(Array)
      highest = (@arr[i].val[0] >= @arr[left(i)].val[0]) ? i : left(i) if left(i) < @arr.size
      highest = (@arr[highest].val[0] >= @arr[right(i)].val[0]) ? highest : right(i) if right(i) < @arr.size
    else
      highest = (@arr[i].val >= @arr[left(i)].val) ? i : left(i) if left(i) < @arr.size
      highest = (@arr[highest].val >= @arr[right(i)].val) ? highest : right(i) if right(i) < @arr.size
    end
    
    if(highest != i)
      @arr[i], @arr[highest] = [@arr[highest], @arr[i]]
      @hash[@arr[i]] = i
      @hash[@arr[highest]] = highest
      max_heapify(highest)
    end
  end
  
  def increase_val(node, val)
    if val.is_a?(Array)
      return 'val is less than node->val' if val[0] < node.val[0]
    else
      return 'val is less than node->val' if val < node.val
    end
    
    node.val = val
    index  = @hash[node]
    
    greater = false
    
    if val.is_a?(Array)
      greater = @arr[parent(index)].nil? ? false : (@arr[parent(index)].val[0] < @arr[index].val[0])
    else
      greater = @arr[parent(index)].nil? ? false : (@arr[parent(index)].val < @arr[index].val)
    end

    while (index > 1) && greater do
      index = parent(index)
      max_heapify(index)
    end

    @v_to_node[node.val] ||= []
    @v_to_node[node.val] << node
  end
end

def max_sliding_window(nums, k)
  m = MaxHeap1.new
  res = []
  
  j = 0
  
  k.times do
    m << nums[j]
    j += 1
  end
  
  i = 0
  j = k - 1
  
  while (j < nums.size) do
    res << m.max
    
    m.delete(nums[i])
    m << nums[j + 1] if (j+1) < nums.size
    
    i += 1
    j += 1
  end
  
  res
end
