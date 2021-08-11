# number of islands

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3

grid = [
  ["2","2","0","0","0"],
  ["2","2","0","0","0"],
  ["0","0","3","0","0"],
  ["0","0","0","4","4"]
]

def num_islands(grid)
  return 0 if grid.size == 0
  
  color = 1
  m = grid.size
  n = grid.first.size
  
  (0..(m - 1)).each do |i|
    (0..(n - 1)).each do |j|
      if(grid[i][j] == "1")
        color += 1
        dfs(grid, i, j, m, n, color.to_s)
      end
    end
  end
  
  color - 1
end

def dfs(grid, i, j, m, n, color)
  grid[i][j] = color
  dfs(grid, i+1, j, m, n, color) if (i+1 < m)  && grid[i+1][j] == "1"
  dfs(grid, i-1, j, m, n, color) if (i-1 >= 0) && grid[i-1][j] == "1"
  dfs(grid, i, j+1, m, n, color) if (j+1 < n)  && grid[i][j+1] == "1"
  dfs(grid, i, j-1, m, n, color) if (j-1 >= 0) && grid[i][j-1] == "1"
end

Time
O(m*n)
m = # of rows
n = # of cols
S = O(m*n)
space = O(m*n) in worst-case
      = size of call stack

Test
grid = [["1","1","0","0","0"]]

grid = [["1"],
        ["1"],
        ["0"]]

grid = [["1"]]
grid = [["0"]]

no island
