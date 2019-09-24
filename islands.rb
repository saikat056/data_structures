def num_islands(grid)
  return 0 if grid == []
  @grid = grid
  @total_rows = grid.size
  @total_cols = grid.first.size
  arr = []
  (0..(@total_rows - 1)).each do |i|
    (0..(@total_cols - 1)).each do |j|
      next if grid[i][j] == '0'
      arr.push([i,j])
    end
  end
  island_count = 0
  @visited_hash = {}
  while arr.size != 0
    @queue = []
    @queue.push(arr.first)
    @visited_hash[arr.first] = true
    while @queue.size != 0
      node = @queue.shift
      push_adjacent_nodes(node)
      arr.delete(node)
    end
    island_count += 1

  end
  island_count
end

def push_adjacent_nodes(node)
  push_to_queue([node[0] - 1 , node[1]])
  push_to_queue([node[0] + 1 , node[1]])
  push_to_queue([node[0] , node[1] - 1])
  push_to_queue([node[0] , node[1] + 1])
end

def push_to_queue(node)
  if @visited_hash[node] != true && node[0] >= 0  && node[0] < @total_rows && node[1] >= 0 && node[1] < @total_cols && @grid[node[0]][node[1]] == '1'
    @queue.push(node)
    @visited_hash[node] = true
  end
end
