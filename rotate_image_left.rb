def rotate_left(matrix)
  m = matrix
  n = m.size
  
  (0..(n-1)).each do |i|
    (i..(n-2-i)).each do |j|
      t1 = m[n-1-i][j]
      m[n-1-i][j] = m[j][i]
      t2 = m[n-1-j][n-1-i]
      m[n-1-j][n-1-i] = t1
      t3 = m[i][n-1-j]
      m[i][n-1-j] = t2
      m[j][i] = t3
    end
  end
end
