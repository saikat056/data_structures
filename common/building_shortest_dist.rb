grid = [[1,0,2,0,1],
        [0,0,0,0,0],
        [0,0,1,0,0]]

grid = [[1,0,2,0,1],[0,0,0,0,0], [0,0,1,0,0]]

# @param {Integer[][]} grid
# @return {Integer}
def shortest_distance(grid)
  row_num = grid.size
  col_num = grid[0].size
  
  building_hash = {}
  row_num.times do |r|
    col_num.times do |c|
      building_hash[[r,c]] = Float::INFINITY if grid[r][c] == 1
    end
  end
  
  min_distance = Float::INFINITY
  row_num.times do |r|
    col_num.times do |c|
      if grid[r][c] == 0
        min_distance = [bfs(grid, r, c, row_num, col_num, building_hash), min_distance].min
      end
    end
  end
  
  min_distance == Float::INFINITY ? -1 : min_distance
end

def bfs(grid, r, c, row_num, col_num, building_hash)
  queue = []
  visited = {}
  
  building_hash.keys.each{|k| building_hash[k] = Float::INFINITY }
  
  queue.push([r, c, 0])
  
  while !queue.empty? do
    cell = queue.shift
    cord = [cell[0], cell[1]]
    visited[cord] = true
    
    next if grid[cell[0]][cell[1]] == 2
    
    if grid[cell[0]][cell[1]] == 1
      b = [cell[0], cell[1]]
      distance = cell[2]
      building_hash[b] = [building_hash[b], distance].min
      next
    end
    
    next_cell = [cell[0] + 1, cell[1], cell[2] + 1]
    cord = [next_cell[0], next_cell[1]]
    queue.push(next_cell) if next_cell[0] < row_num && !visited[cord]
    
    next_cell = [cell[0] - 1, cell[1], cell[2] + 1]
    cord = [next_cell[0], next_cell[1]]
    queue.push(next_cell) if next_cell[0] >= 0 && !visited[cord]
    
    next_cell = [cell[0], cell[1] + 1, cell[2] + 1]
    cord = [next_cell[0], next_cell[1]]
    queue.push(next_cell) if next_cell[1] < col_num && !visited[cord]
    
    next_cell = [cell[0], cell[1] - 1, cell[2] + 1]
    cord = [next_cell[0], next_cell[1]]
    queue.push(next_cell) if next_cell[1] >= 0 && !visited[cord]
  end
  
  building_hash.values.sum
end
