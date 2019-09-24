class Node
  attr_accessor :left, :right, :value
  def initialize(value, left=nil, right=nil)
    @left = left
    @right = right
    @value = value
  end
end

class BinarySearchTree
  def create_tree(array)
    return nil if array.size == 0
    root = Node.new(array.first)
    (1..array.size-1).each { |index| insert(root, Node.new(array[index])) }
    root
  end

  def insert(tree, new_node)
    if tree.value > new_node.value
      return insert(tree.left, new_node) if tree.left
      tree.left = new_node
    else
      return insert(tree.right, new_node) if tree.right
      tree.right = new_node
    end
  end

  def height(tree)
    return 0 if tree.nil? || (tree.left.nil? && tree.right.nil?)
    return 1 + [ height(tree.left), height(tree.right) ].max
  end

  def level_order_traversal(tree)
    return "" if tree.nil?
    queue = [tree]
    node_value_arr = []
    while !queue.empty?
      current_node = queue.shift
      node_value_arr.push(current_node.value)
      queue.push(current_node.left) if current_node.left
      queue.push(current_node.right) if current_node.right
    end
    puts node_value_arr.join(" ").to_s
  end
end

