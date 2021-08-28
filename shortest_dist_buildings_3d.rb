def shortest_distance(grid)
  m = grid.size
  n = grid.first.size
  
  b_h = {}
  (0..(m - 1)).each do |i|
    (0..(n - 1)).each do |j|
      b_h[[i,j]] = Float::INFINITY if grid[i][j] == 1
    end
  end
  
  global_min = Float::INFINITY
  
  # T = O(m^2 * n^2)
  (0..(m - 1)).each do |i|
    (0..(n - 1)).each do |j|
      if grid[i][j] == 0
        # T = O(m * n )
        global_min = [bfs(i, j, grid, b_h), global_min].min
      end
    end
  end
  
  global_min == Float::INFINITY ? -1 : global_min
end

def bfs(r, c, grid, b_h)
  m = grid.size
  n = grid.first.size
  
  b_h.keys.each do |key|
    b_h[key] = Float::INFINITY
  end
  
  # S = O(m*n)
  visited = {}
  
  # S = O(m*n)
  queue = [[r, c, 0]]
  while !queue.empty? do
    cell = queue.shift
    
    next if grid[cell[0]][cell[1]] == 2
    
    if grid[cell[0]][cell[1]] == 1
      key = [cell[0], cell[1]]
      b_h[key] = [b_h[key], cell[2]].min
      next
    end
    
    visited[[cell[0], cell[1]]] = true
    
    node = [cell[0] + 1, cell[1], cell[2] + 1]
    queue.push(node) if (node[0] < m) && !visited[[node[0], node[1]]]
    
    node = [cell[0] - 1, cell[1], cell[2] + 1]
    queue.push(node) if (node[0] >= 0) && !visited[[node[0], node[1]]]
    
    node = [cell[0], cell[1] + 1, cell[2] + 1]
    queue.push(node) if (node[1] < n) && !visited[[node[0], node[1]]]
    
    node = [cell[0], cell[1] - 1, cell[2] + 1]
    queue.push(node) if (node[1] >= 0) && !visited[[node[0], node[1]]]
    
  end
  
  b_h.values.sum
end
