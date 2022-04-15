def rotate(matrix)
  m = matrix
  n = m.size
  
  (0..(n-1)).each do |i|
    (i..(n-2-i)).each do |j|
      t1 = m[j][n-1-i]
      m[j][n-1-i] = m[i][j]
      t2 = m[n-1-i][n-1-j]
      m[n-1-i][n-1-j] = t1
      t3 = m[n-1-j][i]
      m[n-1-j][i] = t2
      m[i][j] = t3
    end
  end
end
