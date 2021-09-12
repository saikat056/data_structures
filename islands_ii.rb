Number of Islands II

Input: m = 3, n = 3, positions = [[0,0],[0,1],[1,2],[2,1]]
Output: [1,1,2,3]

          0.  1.  2.   3. 4.  5
set. = [-4,   0,nil,   0, 3,nil]

3
3
positions = [[0,1],[1,2],[2,1],[1,0],[0,2],[0,0],[1,1]]

4
9
[[2,6],[2,5],[1,2],[3,1],[1,5],[2,4],[0,4],[3,7],[3,3],[2,8]]

def num_islands2(m, n, positions)
  mat = Array.new(m) { Array.new(n) { 0 }}
  
  set = Array.new(m*n) { nil }
  
  num = 0
  
  arr = []
  
  positions.each do |p|
    x, y = p
    mat[x][y] = 1
    
    if !set[x*n+y].nil?
      arr << num
      next
    end
    
    set[x*n+y] = -1
    num += 1
    
    num -= 1 if (x+1 <  m) && merge(mat, set, x, y, x+1, y)
    num -= 1 if (x-1 >= 0) && merge(mat, set, x, y, x-1, y)
    num -= 1 if (y+1 <  n) && merge(mat, set, x, y,   x, y+1)
    num -= 1 if (y-1 >= 0) && merge(mat, set, x, y,   x, y-1)
    
    arr << num
  end
  
  arr
end


def merge(mat, set, x,y, i, j)
  m = mat.size
  n = mat.first.size
  
  return false if mat[i][j] == 0
  
  elem1 = find_root(set, x*n+y)
  set[x*n+y] = elem1 if (x*n+y) != elem1
  
  elem2 = find_root(set, i*n+j)
  set[i*n+j] = elem2 if (i*n+j) != elem2
  
  return false if elem1 == elem2
  
  elem1, elem2 = [elem2, elem1] if set[elem1] > set[elem2]
  
  set[elem1] += set[elem2]
  set[elem2] = elem1 if elem1 != elem2
  
  set[i*n+j] = elem1 if (i*n+j) != elem1
  
  return true
end

def find_root(set, i)
  while set[i] >= 0 do
    i = set[i]
  end
  i
end
