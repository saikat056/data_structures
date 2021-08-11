# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}

def right_side_view(root)
  return [] if root.nil?
  
  arr = []
  queue = []
  queue.push(root)
  queue.push(nil)
  
  while !queue.empty? do
    elem = queue.shift
    
    break if elem.nil?
    
    queue.push(elem.left) if elem.left
    queue.push(elem.right) if elem.right
    
    if queue.first.nil?
       arr << elem.val
       queue.shift
       queue.push(nil)
    end
  end
  
  arr
end

# Test
       1
     /.  \
     2    3
 
queue = [1, nil]
queue = [2,3, nil]
arr  = [1,3]

# Test
       1
     /.  \
     2    3
    / \  /
    4  5 6

queue = [1, nil,2,3,nil,4,5,6,nil]
arr = [1,3,6]
first = 1
sec = nil


# Time complexity
       1
     /.  \
     2    3
    / \  /
    4  5 6

arr = [1,3,6]


worst-case= O(n)
n = number of nodes
 
# Tesr
root = [1, nil, nil]
arr = [1]
  
# Test
root = [nil]

# Test
root = [1, 2, 3]
arr = [1,3]




