You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.

Return the size of the largest island in grid after applying this operation.

An island is a 4-directionally connected group of 1s.
 
grid = [[0,1,1,1,0],
        [0,0,0,0,0],
        [0,0,1,0,0],
        [0,1,1,1,0]
        ]


grid = [[0,2,2,2,0],
        [0,0,0,0,0],
        [0,0,3,0,0],
        [0,3,3,3,0]
        ]

hash = {2: 3, 3: 4}


def largest_island(grid)
  n = grid.size
  hash = {}
  color = 1
  
  # T = O(n^2)
  (0..(n - 1)).each do |i|
    (0..(n - 1)).each do |j|
      if grid[i][j] == 1
        color += 1
        count = [0]
        dfs(grid, i, j, color, count)
        hash[color] = count[0]
      end
    end
  end
  
  max_count = -Float::INFINITY
  max_count = [max_count, hash.values.max].max if hash.values.size > 0
    
  (0..(n - 1)).each do |i|
    (0..(n - 1)).each do |j|
      if grid[i][j] == 0
        h = {}
        
        if (i + 1) < n && (grid[i+1][j] != 0)
          child = grid[i+1][j]
          h[child] = hash[child]
        end
        
        if (i - 1) >= 0 && (grid[i-1][j] != 0)
          child = grid[i-1][j]
          h[child] = hash[child]
        end
        
        if (j + 1) < n && (grid[i][j+1] != 0)
          child = grid[i][j+1]
          h[child] = hash[child]
        end
        
        if (j - 1) >= 0 && (grid[i][j-1] != 0)
          child = grid[i][j-1]
          h[child] = hash[child]
        end
        
        max_count = [max_count, h.values.sum + 1].max if h.values.size > 0
      end
    end
  end
  
  max_count == -Float::INFINITY ? 1 : max_count
end

# T = O(n^2)
def dfs(grid, i, j, color, count)
  n = grid.size
  count[0] += 1
  grid[i][j] = color
  
  dfs(grid, i + 1, j, color, count) if (i + 1 < n  ) && (grid[i+1][j] == 1)
  dfs(grid, i - 1, j, color, count) if (i - 1 >= 0 ) && (grid[i-1][j] == 1)
  dfs(grid, i, j + 1, color, count) if (j + 1 < n  ) && (grid[i][j+1] == 1)
  dfs(grid, i, j - 1, color, count) if (j - 1 >= 0 ) && (grid[i][j-1] == 1)
end

Time
-----
  T = O(n^2) + O(n^2) = O(n^2)

Space
-----
  S = call stack size of dfs = O(n^2)
