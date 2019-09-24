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
    extremest = @array[left(index)].send(@operator, @array[index]) ? left(index) : index if left(index) < @heap_size
    extremest = @array[right(index)].send(@operator, @array[extremest]) ? right(index) : extremest if right(index) < @heap_size
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

  def change_value(index, value)
    if index < 0 || index >= heap_size
      puts "Invalid Index"
      return
    end
    @array[index] = value
    parent_index = parent(index)
    while parent_index >= 0 do
      heapify(parent_index)
      parent_index = parent(parent_index)
    end
  end

  def insert(value)
    @array.push(value)
    @heap_size = @array.size
    change_value(@heap_size-1, value)
  end
end

class MaxHeap < Heap
  def initialize(array)
    super(array, :>)
  end

  def maximum; top; end

  def extract_maximum; extract_top; end

  def increase_key(index, value) 
    if @array[index] > value
      puts "Can't increase the value at index. As value is less than array value"
    else
      change_value(index, value)
    end
  end

  def insert(value); super(value); end
end

class MinHeap < Heap
  def initialize(array)
    super(array, :<)
  end

  def minimum; top; end

  def extract_minimum; extract_top; end

  def decrease_key(index, value) 
    if @array[index] < value
      puts "Can't decrease the value at index. As value is larger than array value"
    else
      change_value(index, value)
    end
  end

  def insert(value); super(value); end
end

class RunningMedian
  def initialize
    @max_heap = MaxHeap.new([])
    @min_heap = MinHeap.new([])
  end

  def insert(value)
    first_heap, second_heap, top = @min_heap.heap_size > @max_heap.heap_size ? [@min_heap, @max_heap, :minimum] 
                                 : [@max_heap, @min_heap, :maximum]
    top_value = first_heap.send("#{top}")
    if top_value && top_value.send(first_heap.operator, value)
      second_heap.insert(first_heap.send("extract_#{top}"))
      first_heap.insert(value)
    else
      second_heap.insert(value)
    end
  end

  def median
    return nil if @min_heap.heap_size == 0 && @max_heap.heap_size == 0
    return @min_heap.minimum if @max_heap.heap_size == 0
    return @max_heap.maximum if @min_heap.heap_size == 0
    return ((@max_heap.maximum + @min_heap.minimum).to_f/2) if @max_heap.heap_size == @min_heap.heap_size
    return @max_heap.heap_size > @min_heap.heap_size ? @max_heap.maximum : @min_heap.minimum
  end
end


max_heap = MaxHeap.new([3,7,1,9,7,12,7,19,2])
puts max_heap.sort
puts "++++++++++++++++"
min_heap = MinHeap.new([3,7,1,9,7,12,7,19,2])
puts min_heap.sort
puts "++++++++++++++++"
puts "Heap size: #{max_heap.heap_size}"

puts "+++++++++++++++++++++++"
puts "Running median"
puts "+++++++++++++++++++++++"

running_median = RunningMedian.new
running_median.insert(1)
running_median.insert(2)
running_median.insert(3)
running_median.insert(4)
running_median.insert(5)
running_median.insert(6)
running_median.insert(7)
puts running_median.median
running_median.insert(8)
puts running_median.median
