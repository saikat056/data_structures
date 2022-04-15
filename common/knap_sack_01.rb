# 0-1 knapsack

values = [60,100,120]
weight = [10,20,30]
Solution = 220
W = 50

def knapsack_01(values, weight, w)
  n = weight.size

  # S = O(n*w)
  mat = Array.new(n+1) { Array.new(w+1) {0}}

  # T = O(n*w)
  (1..n).each do |i|
    (1..w).each do |j|
      mat[i][j] = mat[i-1][j]

      if j >= weight[i-1]
        t =  mat[i-1][j - weight[i-1]] + values[i-1]
        mat[i][j] = [mat[i][j], t].max
      end
    end
  end

  mat[n][w]
end

Time
----
  T = O(n*w)

Space
-----
  S = O(n*w)

Test
----

values = [6,10,12]
weight = [1,2,3]
Solution = 22
w = 5
n = 3


mat =

     0 | 1 | 2 | 3 | 4 | 5
   0 0   0   0   0   0   0
   1 0   6   6   6   6   6
   2 0   6   10  16  16  16
   3 0   6   10  16  18  22

   12+ 10

mat[i][j] = [mat[i-1][j], (mat[i-1][j-weight[i-1]] + values[i-1]) if j >= weight[i-1]].max
