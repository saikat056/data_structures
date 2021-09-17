# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  pre_index = [0]
  dfs(pre_index, preorder, inorder, 0, inorder.size - 1)
end

def dfs(pre_index, preorder, inorder, start, stop)
  return nil if start > stop   
 
  elem = preorder[pre_index[0]]
  in_index = search(inorder, start, stop, elem)
  
  node = TreeNode.new(elem)
    
  if start < in_index
    pre_index[0] += 1
    node.left = dfs(pre_index, preorder, inorder, start, in_index - 1)
  end
    
  if in_index < stop
    pre_index[0] += 1
    node.right = dfs(pre_index, preorder, inorder, in_index + 1, stop)
  end
    
  node
end

def search(inorder, start, stop, elem)
  (start..stop).each do |i|
    return i if inorder[i] == elem
  end
end
