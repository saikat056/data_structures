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
# @return {Integer[][]}
def zigzag_level_order(root)
  return [] if root.nil?
  
  hash = {}
  
  dfs(root, 0, hash)
  
  m = hash.keys.max
  
  result = []
  
  (0..m).each do |i|
    result << ((i%2 == 1) ? hash[i].reverse : hash[i])
  end
  
  result
end

def dfs(root, level, hash)
  return if root.nil?
  
  hash[level] ||= []
  hash[level] << root.val
  
  dfs(root.left, level + 1, hash)
  dfs(root.right, level + 1, hash)
end
