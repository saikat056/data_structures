def solve_n_queens(n)
  res = []
  columns = Array.new(n) { -1 } 
  
  (0..(n-1)).each do |col|
    bt(columns, col, 0, res)
  end
  
  print_board(res)
end

def bt(columns, col, row, res)
  n = columns.size
  
  return unless valid_move?(columns, col, row)
  
  # place the queen
  columns[row] = col
  
  return res << columns.dup if row == (n - 1)
  
  (0..(n-1)).each do |c|
    bt(columns, c, row + 1, res)
  end
end

# if row == 0, it will return true becasuse this is the first move ever
# Otherwise, we check with the loop 
def valid_move?(columns, col, row)
  (0..(row - 1)).each do |r|
    # check whether the new move is in same column of any previous move
    return false if columns[r] == col
    
    # check diagonal
    return false if (row - r).abs == (columns[r] - col).abs
  end
  
  true
end

def print_board(solutions)
  return [] if solutions.empty?
  
  boards = []
  n = solutions.first.size
  
  solutions.each do |sol|
    res = []
    
    (0..(n-1)).each do |r|
      str = ""
      
      (0..(n-1)).each do |c|
        str += (sol[r] == c) ? 'Q': '.'
      end
      
      res << str
    end
    
    boards << res
  end
  
  boards
end
