# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
   n = 9
   
   row_h = Array.new(n) { {} }
   col_h = Array.new(n) { {} }
   box_h = Array.new(n) { {} }
    
   (0..(n-1)).each do |i|
     (0..(n-1)).each do |j|
        next if board[i][j] == '.'
         
        b = box_num(i, j)
        e = board[i][j]
         
        return false if row_h[i][e] || col_h[j][e] || box_h[b][e]
         
        row_h[i][e] = col_h[j][e] = box_h[b][e] = true
     end
   end
    
   true
end

def box_num(r, c)
  (r/3)*3 + (c/3)
end
