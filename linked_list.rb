class LinkedList
  attr_accessor :head

  def iniitialize()
    @head = nil
  end
  
  def add(value)
    node = Node.new(value)
    if @head
      n = @head
      n = n.next while n.next
      n.next = node
      node.prev = n
    else
      @head = node
    end
    self
  end

  def insert_before(successor, value)
    n = find(successor)
    return false if n.nil?
    new_node = Node.new(value)
    new_node.next = n
    new_node.prev = n.prev
    n.prev.next = new_node
    n.prev = new_node
    return true
  end

  def insert_after(predecesor, value)
    n = find(predecesor)
    return false if n.nil?
    new_node = Node.new(value)
    new_node.prev = n
    new_node.next = n.next
    n.next.prev = new_node
    n.next = new_node
    return true
  end

  def find(value)
    n = head
    n = n.next while n && n.value != value
    return n
  end
  
  def print
    n = @head
    while n do
      puts n.value
      n = n.next
    end
  end
  
  def delete(value)
    n = @head
    n = n.next while n && n.value != value
    if n
      if n.prev
        n.prev.next = n.next 
      else
        @head = n
      end
    end
  end


end

class Node
  attr_accessor :next, :prev, :value
  def initialize(value)
    @prev = nil
    @next = nil
    @value = value
  end
end
