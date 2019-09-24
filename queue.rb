class Queue
  def initialize
    @arr = []
  end

  def enqueue(value)
    @arr.push(value)
  end

  def dequeue
    @arr.shift
  end

  def peek
    @arr.first
  end

  def size
    @arr.size
  end

  def is_empty?
    @arr.size == 0
  end
end
