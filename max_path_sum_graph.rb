Input: root = [-10,9,20,null,null,15,7]
Output: 42
Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
  
       -10
      9    20
          15  7 


def max_path_sum(root)
  max_value = [-Float::INFINITY]
  
  dfs(root, max_value)
  
  max_value[0]
end

def dfs(node, max_value)
  l_max = -Float::INFINITY
  l_max = [l_max, dfs(node.left, max_value)].max if node.left
  
  r_max = -Float::INFINITY
  r_max = [r_max, dfs(node.right, max_value)].max if node.right
  
  max_value[0] = [max_value[0], node.val, node.val + l_max, node.val + r_max, node.val + l_max + r_max].max
  
  [node.val, node.val + l_max, node.val + r_max].max
end
