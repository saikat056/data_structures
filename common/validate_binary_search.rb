
class Node
  attr_accessor :left, :right, :value
  
  def initialize(left, right, value)
    @left = left
    @right  = right
    @value = value
  end
end
      8
     /  \
    5   9
       /  \
      nil 10
   

def validate_bst(node)
  return true if node.nil?
  
  arr = []
  
  # O(n)
  in_traverse(node, arr)
  
  # O(n)
  check_sorted(arr)
end

# O(n)
def in_traverse(node, arr)
  in_traverse(node.left, arr) if node.left
  arr << node.value
  in_traverse(node.right, arr) if node.right
end

def check_sorted(arr)
  return true if arr.length < 2
  
  # O(n)
  (0..(arr.length - 2)).each do |i|
    return false if arr[i] > arr[i+1]
  end
  
  return true
end

Time complexity
n = number of nodes in the tree
T(n) = O(n)

arr of size n
S(n) = O(n)
