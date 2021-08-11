#Flatten Binary Tree to Linked List

class Node
  attr_accessor :left, :right, :value
  
  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end
end

        1
      /.   \
     2      5
    / \    /  \
    3  4  nil  6

node = Node.new(1, Node.new(2, Node.new(3,nil,nil), Node.new(4, nil, nil)), Node.new(5,nil, Node.new(6, nil, nil)))


def flatten_tree_to_list(node)
  arr = []
  pre_traverse(node, arr)
  
  return if arr.size < 2
  
  # time complexity O(n)
  (0..(arr.length-2)).each do |i|
    arr[i].left = nil
    arr[i].right = arr[i+1]
  end
  
end

# time complexity O(n)
def pre_traverse(node, arr)
  return if node.nil?
  
  arr << node
  pre_traverse(node.left, arr)
  pre_traverse(node.right, arr)
end

Time Complexity
pre_traverse
n = # of nodes
O(n)

Space Complexity
h = height of the tree
O(h)

n = size of array
O(n)
O(n) + O(h) = O(n); n >> h


Test 1:
         1
      /    \
     2      5
    / \    /  \
    3  4  nil  6


Test 2:
         1
      /    \
      2   nil

      [1,2]

Test 3:
         1
      /    \
      nil   2

     [1,2]
