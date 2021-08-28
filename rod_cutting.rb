prices =  [1,5,8,9]
max_revenue

mat= 
         len j-->
         0  1  2  3  4
       0 0  0  0  0. 0.   0 len
price: 1 0  1  2  3. 4    1 |.  i
       3 0. 1. 3  4       2 v
       5                  3

             3      4
      3 = [1,1,1] [2,1]
      
   mat[i][j] = [mat[i-1][j], mat[i][j-i] + p[i-1]].max
      
def rod_cutting(prices)
  p = prices
  n = prices.size
  mat = Array.new(n+1) { Array.new(n+1) { 0 }}
  
  (1..n).each do |i|
    (1..n).each do |j|
      mat[i][j] = mat[i-1][j]
      mat[i][j] = [mat[i][j], mat[i][j-i] + p[i-1]].max if j >= i
    end
  end
  
  mat[-1][-1]
end
 
Time
----
n = size of prices
T = O(n^2)

Space
-----
S = O(n^2)
