class LFUCache

=begin
    :type capacity: Integer
=end
  def initialize(capacity)
    @min_heap = MinHeap.new(capacity)
  end


=begin
    :type key: Integer
        :rtype: Integer
=end
  def get(key)
    @min_heap.get(key)
  end


=begin
    :type key: Integer
        :type value: Integer
            :rtype: Void
=end
  def put(key, value)
    @min_heap.insert(key, value)
  end


end

class Node
  attr_accessor :timestamp, :key, :value, :freq, :index
  def initialize(timestamp: , key: , value: , index: )
    @timestamp = timestamp
    @key = key
    @value = value
    @freq = 0
    @index = index
  end
end

class MinHeap
  def initialize(capacity)
    @capacity = capacity
    @arr = []
    @global_timestamp = 0
    @heap_hash = {}
  end

  def get_now_ts
    @global_timestamp += 1
    return @global_timestamp
  end

  def parent(index)
    (index - 1 ) / 2
  end

  def left(index)
    (index * 2) + 1
  end

  def right(index)
    (index * 2) + 2
  end

  def get_index_smallest(first_index, second_index)
    index_smallest = -1
    if @arr[first_index].freq == @arr[second_index].freq
      index_smallest = @arr[first_index].timestamp < @arr[second_index].timestamp ? first_index : second_index
    else
      index_smallest = @arr[first_index].freq < @arr[second_index].freq ? first_index : second_index
    end
    index_smallest
  end

  def min_heapify(index)
    index_smallest = index
    index_smallest = get_index_smallest(left(index), index) if left(index) < @arr.size 
    index_smallest = get_index_smallest(right(index), index_smallest) if right(index) < @arr.size

    if index_smallest != index
      @arr[index_smallest], @arr[index] = @arr[index], @arr[index_smallest]
      @arr[index_smallest].index = index_smallest
      @arr[index].index = index
      min_heapify(index_smallest)
    end
  end

  def min_heap_extract
    return -1 if @arr.size == 0
    min_node = @arr.first
    last_node = @arr.last
    @arr[0] = last_node
    @arr.pop
    @heap_hash.delete(min_node.key)
    min_heapify(0)
    return min_node
  end

  def increase_freq(index)
    @arr[index].freq += 1
    index = parent(index)
    while index >= 0
      min_heapify(index)
      index = parent(index)
    end
  end

  def insert(key, value)
    return if @capacity == 0
    if @heap_hash[key]
      @heap_hash[key].value = value
      @heap_hash[key].freq += 1
      min_heapify(@heap_hash[key].index)
    else
      min_heap_extract if @arr.size == @capacity
      node = Node.new(timestamp: get_now_ts, key: key, value: value, index: @arr.size)
      @arr.push(node)
      increase_freq(@arr.size - 1)
      @heap_hash[key] = node
    end
  end

  def get(key)
    node = @heap_hash[key]
    return -1 if node == nil
    node.freq += 1
    node.timestamp = get_now_ts
    value = node.value
    min_heapify(node.index)
    return value
  end
end

# Your LFUCache object will be instantiated and called as such:
# # obj = LFUCache.new(capacity)
# # param_1 = obj.get(key)
# # obj.put(key, value)
