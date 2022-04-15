class LRUCache

=begin
    :type capacity: Integer
=end
  def initialize(capacity)
    @list_with_hash = ListWithHash.new(capacity)
  end


=begin
    :type key: Integer
        :rtype: Integer
=end
  def get(key)
    @list_with_hash.get_value(key)
  end


=begin
    :type key: Integer
        :type value: Integer
            :rtype: Void
=end
  def put(key, value)
    @list_with_hash.append_node(key, value)
  end

end

class Node
  attr_accessor :prev, :next, :value, :key
  def initialize(key, value)
    @key = key
    @value = value
    @prev = nil
    @next = nil
  end
end

class ListWithHash
  def initialize(capacity)
    @capacity = capacity
    @start = Node.new(nil, nil)
    @last = Node.new(nil, nil)
    @start.next = @last
    @last.prev = @start
    @node_hash = {}
  end

  def get_value(key)
    node = @node_hash[key] 
    return -1 if node == nil
    value = node.value
    delete_node(key)
    append_node(key, value)
    value
  end

  def append_node(key, value)
    delete_node(key) if @node_hash[key]
    make_space
    node = Node.new(key, value)
    node.next = @last
    node.prev = @last.prev
    @last.prev.next = node
    @last.prev = node
    @node_hash[key] = node
  end

  private

  def delete_node(key)
    return if @node_hash.size == 0
    node = @node_hash[key]
    node.next.prev = node.prev
    node.prev.next = node.next
    @node_hash.delete(key)
  end

  def make_space
    delete_node(@start.next.key) if @node_hash.size == @capacity
  end
end

# Your LRUCache object will be instantiated and called as such:
# # obj = LRUCache.new(capacity)
# # param_1 = obj.get(key)
# # obj.put(key, value)
