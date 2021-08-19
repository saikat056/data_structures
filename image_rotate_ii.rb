# @param {Integer[][]} mat
# @param {Integer[][]} target
# @return {Boolean}
def find_rotation(mat, target)
  return false if mat.size != target.size
 
  return true if equal_mat?(mat, target)
    
  (mat.size + 1).times do |t|
    rotate(mat)
    return true if equal_mat?(mat, target)
  end
    
  false
end

def equal_mat?(m, n)
  (0..(m.size - 1)).each do |i|
     (0..(m.size-1)).each do |j|
         return false if m[i][j] != n[i][j]
     end
  end
  
  true
end

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
