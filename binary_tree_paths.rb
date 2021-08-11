# binary tree paths

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
# @return {String[]}

def binary_tree_paths(root)
  arr = []
  dfs(root, "", arr) if root
  arr
end

def dfs(node, str, arr)
  if node.left.nil? && node.right.nil?
    arr << (str.empty? ? "" : str + "->") + node.val.to_s
    return
  end
  
  dfs(node.left,  (str.empty? ? "" : str + "->") + node.val.to_s, arr) if node.left
  dfs(node.right, (str.empty? ? "" : str + "->") + node.val.to_s, arr) if node.right
end

Time
n = # of vertices
T = O(n)
S = O(n) call-stack size

Test

     1

        1
       /  \
      2   3
      
