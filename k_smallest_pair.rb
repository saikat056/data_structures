class Node
  attr_accessor :val

  def initialize(v)
    @val = v
  end
end

class MinHeap1
  def initialize
    @arr = [nil]
    @hash = {}
    @v_to_node = {}
  end

  def push(v)
    insert(Node.new(v))
  end

  alias_method :<<, :push

  def min
    return nil if @arr.size <= 1

    @arr[1].val
  end

  def min_node
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
    
    min  = @arr[1]
    @arr[1], @arr[-1] = [@arr[- 1], @arr[1]]
    @hash[@arr[1]] = 1
    @hash.delete(min)
    @arr.pop
    @v_to_node[min.val].delete(min)

    if @v_to_node[min.val].empty?
      @v_to_node.delete(min.val)
    end

    min_heapify(1) if size > 0
    
    min.val
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

    min_heapify(1) if size > 0

    node.val
  end

  def insert(node)
    val = node.val.dup

    if val.is_a?(Array)
      node.val[0] = Float::INFINITY
    else
      node.val = Float::INFINITY
    end

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

    if @arr[i].val.is_a?(Array)
      lowest = (@arr[i].val[0] <= @arr[left(i)].val[0]) ? i : left(i) if left(i) < @arr.size
      lowest = (@arr[lowest].val[0] <= @arr[right(i)].val[0]) ? lowest : right(i) if right(i) < @arr.size
    else
      lowest = (@arr[i].val <= @arr[left(i)].val) ? i : left(i) if left(i) < @arr.size
      lowest = (@arr[lowest].val <= @arr[right(i)].val) ? lowest : right(i) if right(i) < @arr.size
    end
    
    if(lowest != i)
      @arr[i], @arr[lowest] = [@arr[lowest], @arr[i]]
      @hash[@arr[i]] = i
      @hash[@arr[lowest]] = lowest
      min_heapify(lowest)
    end
  end
  
  def decrease_val(node, val)
    if val.is_a?(Array)
      return 'val is greater than node->val' if val[0] > node.val[0]
    else
      return 'val is greater than node->val' if val > node.val
    end
    
    node.val = val
    index  = @hash[node]
    
    greater = false
    
    if val.is_a?(Array)
      greater = @arr[parent(index)].nil? ? false : (@arr[parent(index)].val[0] > @arr[index].val[0])
    else
      greater = @arr[parent(index)].nil? ? false : (@arr[parent(index)].val > @arr[index].val)
    end

    while (index > 1) && greater do
      index = parent(index)
      min_heapify(index)
    end

    @v_to_node[node.val] ||= []
    @v_to_node[node.val] << node
  end
end


# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
  m = MinHeap1.new
  
  nums1.each do |a|
    nums2.each do |b|
      m << [a+b,[a, b]]
    end
  end
  
  res = []
  
  k.times do
    e = m.pop
      
    break if e.nil?
      
    res << e[1]
  end
  
  res
end
