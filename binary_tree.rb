load 'queue.rb'
class BinaryTree
  class Node
    attr_accessor :value, :left, :right
    def initialize(v, left_tree = nil, right_tree = nil)
      @value = v
      @left = left_tree
      @right = right_tree
    end
  end

  class DummyNode < Node
  end

  def initialize
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 34, 50, 89, 230,23,45, 78,478,10,0,0,1,2,3,4,-1,-290].sort
    root  = make_tree(arr, 0, arr.size - 1)
    print_in_order(root)
    puts "+++++++++++++++++++++++++"
    print_tree(root)
    puts "======== Height ============="
    puts height(root, 0)
  end

  def make_tree(arr, start_index, end_index)
    return nil if start_index > end_index
    return Node.new(arr[start_index], nil, nil) if start_index == end_index
    mid_distance = ((end_index - start_index + 1) / 2)
    mid_index = mid_distance + start_index
    return Node.new(arr[mid_index], 
                      make_tree(arr, start_index, mid_index - 1), 
                      make_tree(arr, mid_index + 1, end_index))
  end

  def print_in_order(node)
    print_in_order(node.left) if node.left
    puts "#{node.value},"
    print_in_order(node.right) if node.right
  end

  def height(node, current_height)
    return current_height if node.nil? || (node.left.nil? && node.right.nil?)
    return [height(node.left, current_height + 1), height(node.right, current_height + 1)].max if node.left && node.right
    return height(node.left, current_height + 1) if node.left
    return height(node.right, current_height + 1)
  end

  def handle_dummy_node(node, current_flag)
    if node.value == current_flag
      print " || " 
    else
      current_flag = node.value
      print "\n"
    end
    current_flag
  end

  def handle_tree_node(node, queue, current_flag)
    if node
      print "#{node.value},"
      queue.enqueue(DummyNode.new(current_flag + 1))
      queue.enqueue(node.left)
      queue.enqueue(node.right)
    else
      print "nil,"
    end
    current_flag
  end

  def print_tree(node)
    current_flag = 0
    queue = Queue.new
    queue.enqueue(node)
    while !queue.is_empty?
      node = queue.dequeue
      current_flag = node.is_a?(DummyNode) ?  handle_dummy_node(node, current_flag) : handle_tree_node(node, queue, current_flag)
    end
  end
end
