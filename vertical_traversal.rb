
def vertical_traversal(root)
  node = root
  c = 0 
  
  while node do
    node = node.left
    c += 1 if node
  end
  
  hash = {}
  
  dfs(root, 0, c, hash)
  
  res = []
  
  hash.keys.sort.each do |i|
    arr = hash[i].sort_by{|x| [x[0], x[1]]}
    res << arr.map{|x| x[1]}
  end
  
  res
end

def dfs(node, r, c, hash)
  return if node.nil?
  
  hash[c] ||= []
  hash[c] << [r, node.val]
  
  dfs(node.left,  r + 1, c - 1, hash)
  dfs(node.right, r + 1, c + 1, hash)
end


