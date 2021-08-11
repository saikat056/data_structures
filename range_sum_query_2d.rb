matrix = 
[[3, 0, 1, 4, 2], 
 [5, 6, 3, 2, 1], 
 [1, 2, 0, 1, 5],
 [4, 1, 0, 1, 7], 
 [1, 0, 3, 0, 5]]

class NumMatrix
    def initialize(matrix)
      m = matrix.size
      n = matrix.first.size
      @dp = Array.new(m) { Array.new(n) {0}}
      
      @dp[0][0] = matrix[0][0]
      
      (1..(m-1)).each do |i|
        @dp[i][0] = @dp[i-1][0] + matrix[i][0]
      end
      
      (1..(n-1)).each do |j|
        @dp[0][j] = @dp[0][j-1] + matrix[0][j] 
      end
      
      (1..(m-1)).each do |i|
        (1..(n-1)).each do |j|
          @dp[i][j] = @dp[i-1][j-1] + (@dp[i-1][j] - @dp[i-1][j-1]) + (@dp[i][j-1] - @dp[i-1][j-1]) + matrix[i][j]
        end
      end
    end


    def sum_region(row1, col1, row2, col2)
      return @dp[row1][col1] if row1 == row2 && col1 == col2
      return (@dp[row2][col1] - @dp[row1-1][col1]) if col1 == col2
      return (@dp[row1][col2] - @dp[row1][col1-1]) if row1 == row2
      
      @dp[row2][col2] - @dp[row1-1][col1-1] - (@dp[row1-1][col2] - @dp[row1-1][col1-1]) - (@dp[row2][col1-1] - @dp[row1-1][col1-1])
    end
end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)
