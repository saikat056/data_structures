def coin_change(coins, amount)
  return -1 if coins.empty? || (amount <= 0)

  row_num = coins.size + 1
  col_num = amount + 1
  mat = Array.new(row_num) { Array.new(col_num) }
  
  col_num.times { |index|  mat[0][index] = 0 }
  (0..(row_num-1)).each { |index| mat[index][0] = 1 }

  (1..(row_num - 1)).each do |i|
    (1..(col_num - 1)).each do |j|
      mat[i][j] = mat[i-1][j]
      mat[i][j] += mat[i][j - coins.last] if j >= coins.last
    end
  end

  result = mat[row_num - 1][col_num - 1]
  result == 0 ? -1 : result
end

# time complexity
row_num = O(coins.size)
col_num = O(amount)

Time = O(coins.size x amount)
Space = O(coins.size x amount)

# test
coins = [3,5]
AMOUNT = 7

# test 
coins = [1,2,5]
AMOUNT = 0
return -1

# test
coins = []
AMOUNT = 10
retrun -1 

# test 
coins = [1,2,5]
AMOUNT = 10

row_num = 4
col_num  = 11
mat is an array of 4 x 11

         0   1   2   3  4  5
        ------------------
[]       1 | 0 | 0 | 0 |
[1]      1 | 1 | 1 | 1 |
[1,2]    1 | 1 | 2 | 2 |
[1,2,5]  1 | 1 | 1 | 1 | | 4


3  = 1.1.1 + 2.1 + 
mat[i][j] = mat[i-1][j] + mat[i][j-coins.last]

5 = 5 + 1.1.1.1.1 + 2.1.1.1 + 2.2.1

