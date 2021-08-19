# Total number of ways to change the amount by coins

def coin_change(coins, n)
  m = coins.size
  # S = O(m*n)
  mat = Array.new(m+1) { Array.new(n+1) { 0 }}

  # O(n)
  (1..n).each do |j|
    mat[1][j] = 1
  end

  # O(m)
  (1..m).each do |i|
    mat[i][0] = 1
  end

  # O(m*n)
  (1..m).each do |i|
    (1..n).each do |j|
      mat[i][j] = mat[i-1][j]
      mat[i][j] += mat[i][j-coins[i-1]] if j >= coins[i-1]
    end
  end

  mat[m][n]
end

Time
----
  m = coins.size
  n
  T = O(m*n)

Space
-----
  S = O(m*n)

Test
----

  coins = [1,2,5]
  n = 6

   m =
       0 | 1 | 2 | 3 | 4  |5 | 6 |
   0   0   0   0   0   0   0   0
   1 | 1   1   1   1   1   1   1
   2 | 1   1   2   2   3   3   4
   5 | 1   1   2   2   3   4   5

   3 = [1,1,1],[2,1]
   4 = [2,2], [2,1,1], [1,1,1,1]
   6 = [1,1,1,1,1,1], [5,1], [2,2,1,1], [2,2,2], [2,1,1,1,1]
   mat[i][j] = mat[i-1][j] + mat[i][j-coins[i-1]]
