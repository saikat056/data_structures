class Stack
  def initialize(cap)
    @array=[]
    @capacity = cap
  end

  def size()
    @array.size
  end

  def isFull()
    @array.size == @capacity
  end

  def isEmpty()
    @array.size == 0
  end

  def push(value)
    if !isFull()
      @array.push(value)
    else
      puts "Stack is Full"
    end
  end

  def peek
    @array.last
  end

  def pop()
    if !isEmpty()
      @array.pop()
    else
      puts "Stack is Empty"
    end
  end

  def removeFirst
    if !isEmpty
      @array.shift
    else
      puts "Stack is Empty"
    end
  end
end

class MultiStack
  def initialize(num_of_stacks, stack_size)
    @current_stack_index = 0
    @num_of_stacks = num_of_stacks
    @array_of_stacks = Array.new(num_of_stacks)
    num_of_stacks.times{|i| @array_of_stacks[i] = Stack.new(stack_size)}
  end

  def popAt(index)
    if index < 0 || index >= @num_of_stacks
      puts "Invalid stack number"
    else
      ret = @array_of_stacks[index].pop
      shiftStack(index)
      ret
    end
  end

  def shiftStack(ind)
    index = ind
    while(index < @num_of_stacks - 1)
      c_stack = @array_of_stacks[index]
      next_stack = @array_of_stacks[index + 1]
      while !c_stack.isFull && !next_stack.isEmpty
        c_stack.push(next_stack.removeFirst)
      end
      index += 1
    end
  end

  def currentStackSyncable
    @array_of_stacks[@current_stack_index].isEmpty && @current_stack_index > 0 && !@array_of_stacks[@current_stack_index - 1].isFull
  end

  def currentStack
    @current_stack_index -= 1 while currentStackSyncable
    @array_of_stacks[@current_stack_index]
  end

  def isFirstStack
    @current_stack_index == 0
  end

  def isLastStack
    @current_stack_index == (@num_of_stacks - 1)
  end

  def isFull
    isLastStack && currentStack.isFull
  end

  def isEmpty
    isFirstStack && currentStack.isEmpty
  end

  def push(value)
    if !currentStack.isFull
      currentStack.push(value)
    elsif !isLastStack
      @current_stack_index += 1
      currentStack.push(value)
    else
      puts "Multi-Stack is Full"
    end
  end

  def pop
    if !currentStack.isEmpty
      currentStack.pop
    elsif !isFirstStack
      @current_stack_index -= 1
      currentStack.pop
    else
      puts "Stack is empty"
    end
  end

  def peek
    currentStack.peek
  end
end

class SortStack
  def initialize(stack)
    @primaryStack = stack
  end

  def sort
    secondaryStack = Stack.new(@primaryStack.size)
    movesCount = @primaryStack.size
    while !@primaryStack.isEmpty
      minValue = 10000000
      minValueFreq = 0
      while !@primaryStack.isEmpty
        value = @primaryStack.pop
        if value < minValue
          minValue = value
        end
        secondaryStack.push(value)
      end
      
      movesCount.times do |i|
        value = secondaryStack.pop
        if value != minValue
          @primaryStack.push(value)
        else
          minValueFreq += 1
        end
      end
      minValueFreq.times {  secondaryStack.push(minValue) }
      movesCount -= minValueFreq
      minValueFreq = 0
    end

    while !secondaryStack.isEmpty
      @primaryStack.push(secondaryStack.pop)
    end
  end

  def getStack
    @primaryStack
  end
end
