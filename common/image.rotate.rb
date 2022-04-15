Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]

def rotate(matrix)
  len = matrix.size
  recur(matrix, [0,0], [0, len - 1], [len - 1, len - 1], [len - 1, 0], len)
end

def recur(mat, f, s, t, fo, len)
  return if len <= 1
  
  rot_len = len - 2

  (0..rot_len).each do |k|
    temp = mat[s[0] + k][s[1]]
    mat[s[0] + k][s[1]] = mat[f[0]][f[1] + k]
    
    temp2 = mat[t[0]][t[1] - k]
    mat[t[0]][t[1] - k] = temp
    
    temp3 = mat[fo[0] - k][fo[1]]
    mat[fo[0] - k][fo[1]] = temp2
    
    mat[f[0]][f[1] + k] = temp3
  end
  
  
  f  = [f[0]  + 1,   f[1] + 1]
  s  = [s[0]  + 1,   s[1] - 1]
  t  = [t[0]  - 1,   t[1] - 1]
  fo = [fo[0] - 1,  fo[1] + 1]
  
  recur(mat, f, s, t, fo, len - 2)
end

Test
---
  0  1  2
  ---------
  1  2  3 | 0
  4  5  6 | 1
  7  8  9 | 2

len = 3
rot_len = 2
f = [0,0], s =[0,2], t = [2,2], fo = [2,0]
 
