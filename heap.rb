class Heap
  attr_reader :heap_size, :operator
  def initialize(array, operator=:>)
    @array = array
    @heap_size = array.size
    @operator = operator
  end

  def parent(index)
    return -1 if index == 0
    (index - 1)/2
  end

  def left(index)
    index*2 + 1
  end

  def right(index)
    index*2 + 2
  end

  def heapify(index)
    extremest = index
    extremest = @array[left(index)].key.send(@operator, @array[index].key) ? left(index) : index if left(index) < @heap_size
    extremest = @array[right(index)].key.send(@operator, @array[extremest].key) ? right(index) : extremest if right(index) < @heap_size
    if(extremest != index)
      @array[extremest], @array[index] = @array[index], @array[extremest]
      heapify(extremest)
    end
  end

  def build_heap
    (0..(@heap_size/2 - 1)).reverse_each{|x| heapify(x)}
  end

  def sort
    @heap_size = @array.size
    build_heap
    while @heap_size != 0 do
      @array[0], @array[@heap_size-1] = @array[@heap_size-1], @array[0]
      @heap_size -= 1
      heapify(0)
    end
    @heap_size = @array.size
    @array
  end

  def top
    @array.first
  end

  def extract_top
    return nil if @array.size == 0
    top_value = @array[0]
    @array[0], @array[heap_size-1] = @array[heap_size-1], @array[0]
    @array.pop
    @heap_size = @array.size
    heapify(0)
    top_value
  end

  def change_value(index, node)
    if index < 0 || index >= heap_size
      puts "Invalid Index"
      return
    end
    @array[index] = node
    parent_index = parent(index)
    while parent_index >= 0 do
      heapify(parent_index)
      parent_index = parent(parent_index)
    end
  end

  def insert(node)
    @array.push(node)
    @heap_size = @array.size
    change_value(@heap_size-1, node)
  end
end

class MaxHeap < Heap
  def initialize(array)
    super(array, :>)
  end

  def maximum; top; end

  def extract_maximum; extract_top; end

  def increase_key(index, node) 
    if @array[index].key > node.key
      puts "Can't increase the value at index. As value is less than array value"
    else
      change_value(index, node)
    end
  end

  def insert(node); super(node); end
end

class MinHeap < Heap
  def initialize(array)
    super(array, :<)
  end

  def minimum; top; end

  def extract_minimum; extract_top; end

  def decrease_key(index, node) 
    if @array[index].key < node.key
      puts "Can't decrease the value at index. As value is larger than array value"
    else
      change_value(index, node)
    end
  end

  def insert(node); super(node); end
end

class RunningMedian
  def initialize
    @max_heap = MaxHeap.new([])
    @min_heap = MinHeap.new([])
  end

  def insert(node)
    first_heap, second_heap, top = @min_heap.heap_size > @max_heap.heap_size ? [@min_heap, @max_heap, :minimum] 
                                 : [@max_heap, @min_heap, :maximum]
    top_value = first_heap.send("#{top}")
    if top_value && top_value.key.send(first_heap.operator, node.key)
      second_heap.insert(first_heap.send("extract_#{top}"))
      first_heap.insert(node)
    else
      second_heap.insert(node)
    end
  end

  def median
    return nil if @min_heap.heap_size == 0 && @max_heap.heap_size == 0
    return @min_heap.minimum.key if @max_heap.heap_size == 0
    return @max_heap.maximum.key if @min_heap.heap_size == 0
    return ((@max_heap.maximum.key + @min_heap.minimum.key).to_f/2) if @max_heap.heap_size == @min_heap.heap_size
    return @max_heap.heap_size > @min_heap.heap_size ? @max_heap.maximum.key : @min_heap.minimum.key
  end
end

class Node
  attr_accessor :key, :value
  def initialize(key, value=nil)
    @key = key
    @value = value
  end
end


max_heap = MaxHeap.new([Node.new(3),Node.new(7),Node.new(1),Node.new(9),Node.new(7),Node.new(12),Node.new(7),Node.new(19),Node.new(2)])
puts max_heap.sort.map{|x| x.key}
puts "++++++++++++++++"
min_heap = MinHeap.new([Node.new(3),Node.new(7),Node.new(1),Node.new(9),Node.new(7),Node.new(12),Node.new(7),Node.new(19),Node.new(2)])
puts min_heap.sort.map{|x| x.key}
puts "++++++++++++++++"
puts "Heap size: #{max_heap.heap_size}"

puts "+++++++++++++++++++++++"
puts "Running median"
puts "+++++++++++++++++++++++"

running_median = RunningMedian.new
running_median.insert(Node.new(1))
running_median.insert(Node.new(2))
running_median.insert(Node.new(3))
running_median.insert(Node.new(4))
running_median.insert(Node.new(5))
running_median.insert(Node.new(6))
running_median.insert(Node.new(7))
puts running_median.median
running_median.insert(Node.new(8))
puts running_median.median
