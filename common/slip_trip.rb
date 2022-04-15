There's a grid of cells with RR rows (numbered from 11 to RR from top to bottom) and CC columns (numbered from 11 to CC from left to right). The grid wraps around horizontally, meaning that column 11 is just to the right of column CC (and column CC is just to the left of column 11).
The cell in row ii and column jj initially contains one of the following (indicated by the character G_{i,j}G 
i,j
​
 ):
If G_{i,j}G 
i,j
​
  = ".", the cell is empty.
If G_{i,j}G 
i,j
​
  = "*", the cell contains a coin.
If G_{i,j}G 
i,j
​
  = ">", the cell contains an arrow pointing right.
If G_{i,j}G 
i,j
​
  = "v", the cell contains an arrow pointing down.
You may cyclically shift each row to the right as many times as you'd like (including not at all). Each such shift causes each of the row's cells to move 11 column to the right, with its rightmost cell (in column CC) wrapping around and moving to column 11.
After you've finished rotating the rows to your liking, you'll take a trip through the grid, starting by entering the cell at the top-left corner (in row 11 and column 11) downward from above the grid. Upon entering a cell, if it contains a coin that you haven't yet collected, you'll collect it. If it contains an arrow, your direction of travel will change to that of the arrow (either right or down). Either way, you'll then proceed to the next adjacent cell in your direction of travel. If you move rightward from column CC, you'll wrap around to column 11 in the same row, and if you move downward from row RR, you'll end your trip. Note that you may only collect each cell's coin at most once, that your trip might last forever, and that once you begin your trip you cannot shift the grid's rows further.
Determine the maximum number of coins you can collect on your trip.

r = 4
c = 6
g = [['>','*','v','*','>','*'],
     ['*','v','*','v','>','*'],
     ['.','*','>','.','.','*'],
     ['.','*','.','.','*','v']]


r = 3
c = 4
g = [['.','*','*','*'],
    ['*','*','v','>'],
    ['.','*','.','.']]


def slip_trip(g)
  r = g.size
  c = g.first.size
  
  max_count = Array.new(r) { -Float::INFINITY }
  
  i = r -1
  
  while i >= 0 do
    cal_coin(g, i, max_count)
    i -= 1
  end
  
  max_count[0] == -Float::INFINITY ? 0 : max_count[0]
end

def cal_coin(g, i, max_count)
  r = g.size
  c = g.first.size
  
  (0..(c - 1)).each do |j|
    if g[i][j] == '*'
      count = 1
      count += max_count[i+1] if (i+1) < r
      max_count[i] = [max_count[i], count].max
    elsif g[i][j] == 'v'
      count = 0
      count += max_count[i+1] if (i+1) < r
      max_count[i] = [max_count[i], count].max
    elsif g[i][j] == '>'
      visited = {}
      visited[j] = true
      
      count = 0
      k = (j + 1) % c
      
      while !visited[k] do
        visited[k] = true
        
        if g[i][k] == 'v'
          count += max_count[i+1] if (i+1) < r
          break
        elsif g[i][k] == '*'
          count += 1
        end
        
        k = (k + 1) % c
      end
      
      max_count[i] = [max_count[i], count].max
    end
  end
end
