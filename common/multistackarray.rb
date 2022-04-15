class MultiStack
  def initialize(num_of_stacks, stack_size)
    @num_of_stacks = num_of_stacks
    @stack_size = stack_size
    @arr = Array.new(num_of_stacks * stack_size)
    @arr_stacks =  Array.new(num_of_stacks)
    num_of_stacks.times {|i| @arr_stacks[i] = Stack.new(i*capacity, capacity, @arr)}
  end

  def getStack(index)
    @arr_stacks[index]
  end

  def pushAtStack(index, value)
    isPushed = getStack(index).push(value)
    endShiftIndex = getStack(index).
  end
end

class Stack
  def initialize(start, capacity, array)
    @start = start
    @capacity = capacity
    @arr = array
    @size = 0
    @arrCapacity = array.size
  end

  def getStartIndex
    @start
  end

  def getCapacity
    @capacity
  end

  def isEmpty
    @size == 0
  end

  def isFull
    @size == @capacity
  end

  def push(value)
    return false if isFull
    @arr[(@start + @size) % @arrCapacity] = value
    @size += 1
    true
  end

  def pop
    return nil if isEmpty
    ret = @arr[(@start + @size - 1) % @arrCapacity]
    @size -= 1
    ret
  end

  def peek
    return nil if isEmpty
    @arr[(@start + @size - 1) % @arrCapacity]
  end
end

