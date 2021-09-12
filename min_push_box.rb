https://leetcode.com/problems/minimum-moves-to-move-a-box-to-their-target-location/

Input: grid = [["#","#","#","#","#","#"],
               ["#","T","#","#","#","#"],
               ["#",".",".","B",".","#"],
               ["#",".","#","#",".","#"],
               ["#",".",".",".","S","#"],
               ["#","#","#","#","#","#"]]
Output: 3

Input: grid = [["#","#","#","#","#","#"],
               ["#","T","#","#","#","#"],
               ["#",".",".","B",".","#"],
               ["#","#","#","#",".","#"],
               ["#",".",".",".","S","#"],
               ["#","#","#","#","#","#"]]
Output: -1

Input: grid = [["#","#","#","#","#","#"],
               ["#","T",".",".","#","#"],
               ["#",".","#","B",".","#"],
               ["#",".",".",".",".","#"],
               ["#",".",".",".","S","#"],
               ["#","#","#","#","#","#"]]
Output: 5

q = [[[2,3],4], [[3,4],5]]

# @param {Character[][]} grid
# @return {Integer}
def min_push_box(grid)
   pos = []
   grid.each{|x| pos << x.dup}
  
   gen_player_position(pos)
   traverse(grid, pos)
end

def traverse(grid, pos)
  m = grid.size
  n = grid.first.size
  
  b = nil
  
  (0..(m-1)).each do |i|
    (0..(n-1)).each do |j|
      if grid[i][j] == 'B'
        b = [i, j]
      end
    end
  end
  
  return if b.nil?
  
  q = []
  min_distance = -1
  v = {}
  
  q.push([b, 0])
  
  while !q.empty? do
    elem = q.shift
    v[elem[0]] = true
    d = elem[1]
    
    return d if grid[elem[0][0]][elem[0][1]] == 'T'
    
    pos[elem[0][0]][elem[0][1]] = 'S'
    
    x = elem[0][0] + 1
    y = elem[0][1]
    
    if (x < m) && (x-2 >= 0) && (grid[x][y] == '.' || grid[x][y] == 'T') && (pos[x-2][y] == 'S') && !v[[x,y]]
      q.push([[x,y], d+1])
    end
    
    x = elem[0][0] - 1
    y = elem[0][1]
    
    if (x >= 0) && (x+2 < m) && (grid[x][y] == '.' || grid[x][y] == 'T') && (pos[x+2][y] == 'S') && !v[[x,y]]
      q.push([[x,y], d+1])
    end
    
    x = elem[0][0]
    y = elem[0][1] + 1
    
    if (y < n) && (y-2 >= 0) && (grid[x][y] == '.' || grid[x][y] == 'T') && (pos[x][y-2] == 'S') && !v[[x,y]]
      q.push([[x,y], d+1])
    end
    
    x = elem[0][0]
    y = elem[0][1] - 1
    
    if (y >= 0) && (y+2 < n) && (grid[x][y] == '.' || grid[x][y] == 'T') && (pos[x][y+2] == 'S') && !v[[x,y]]
      q.push([[x,y], d+1])
    end
  end
  
  min_distance
end


def gen_player_position(pos)
  m = pos.size
  n = pos.first.size
  
  (0..(m-1)).each do |i|
    (0..(n-1)).each do |j|
      if pos[i][j] == 'S'
        dfs(pos, i, j)
        break
      end
    end
  end
end

def dfs(pos, i, j)
  pos[i][j] = 'S'
  m = pos.size
  n = pos.first.size
  
  dfs(pos, i + 1, j) if (i + 1 <  m) && ((pos[i+1][j] == '.') || (pos[i+1][j] == 'T'))
  dfs(pos, i - 1, j) if (i - 1 >= 0) && ((pos[i-1][j] == '.') || (pos[i-1][j] == 'T'))
  dfs(pos, i, j + 1) if (j + 1 <  n) && ((pos[i][j+1] == '.') || (pos[i][j+1] == 'T'))
  dfs(pos, i, j - 1) if (j - 1 >= 0) && ((pos[i][j-1] == '.') || (pos[i][j-1] == 'T'))
end
