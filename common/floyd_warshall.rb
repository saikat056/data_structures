# Floyd Warshall all pair shortest path

                    +---------------+
                  2 |               |
                    |               | 
                    v   3      1    |     -5          4
              +----*1 ---->*2----->*4--------->*3 --------> *2
              |     |       | 7     ^           ^
              |     | -4    v       | 6         |8
              |     +----> *5-------+           |
              +---------------------------------+
  
mat = [
  [              0,               3,               8, Float::INFINITY,              -4],
  [Float::INFINITY,               0, Float::INFINITY,               1,               7],
  [Float::INFINITY,               4,               0, Float::INFINITY, Float::INFINITY],
  [              2, Float::INFINITY,              -5,               0, Float::INFINITY],
  [Float::INFINITY, Float::INFINITY, Float::INFINITY,               6,               0]
]

def all_pair_shorest(mat)
  n = mat.size
  
  pre = Array.new(n){ Array.new(n) {nil}}
  
  n.times do |i|
    n.times do |j|
      if (mat[i][j] == 0) || (mat[i][j] == Float::INFINITY)
        pre[i][j] = nil
      else
        pre[i][j] = i
      end
    end
  end
  
  # i*j matrix through k node
  # i--->j edge 
  n.times do |k|
    n.times do |i|
      n.times do |j|
        next if i == j
        next if i == k || j == k
        
        if (mat[i][k] + mat[k][j]) < mat[i][j]
          mat[i][j] = mat[i][k] + mat[k][j]
          pre[i][j] = pre[k][j]
        end
      end
    end
  end
  
  [mat, pre]
end
