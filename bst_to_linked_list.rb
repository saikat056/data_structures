# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right
#     def initialize(val=0)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def treeToDoublyList(root)
  return root if root.nil?
    
  if root.left.nil? && root.right.nil?
    root.left = root
    root.right = root
    return root
  end
    
  arr = []
  dfs(arr, root)
  
  # O(n)
  (0..(arr.size-2)).each do |index|
    arr[index].right = arr[index + 1]
    arr[index + 1].left = arr[index]
  end
  
  arr[0].left = arr[arr.size-1]
  arr[arr.size-1].right = arr[0]
  
  arr[0]
end

# in-order traversal
# O(n)
def dfs(arr, root)
  dfs(arr, root.left)  if root.left
  arr << root
  dfs(arr, root.right) if root.right
end
