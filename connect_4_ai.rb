class Connect4
  EMPTY = 0
  HUMAN = 1
  AI = 2

  def initialize
    @r_size = m = 6
    @c_size = n = 7

    # S = O(m*n)
    @grid = Array.new(m) { Array.new(n) { EMPTY } }
    @move_hash = {}
    
    # S = O(n)
    (0..(n-1)).each do |i|
      @move_hash[i] = m-1
    end
  end
  
  def play
    display
    turn = 0
    player = 1
    computer = Computer.new(@grid, @move_hash)

    # T = O(m*n)
    while(turn < (@r_size*@c_size)) do
      puts "Player #{player}'s trun: (0-6)" 

      col = (player == 1 ? get_valid_input : computer.get_turn_mini_max)

      row = @move_hash[col]

      @grid[row][col] = player

      if is_winner?(player, row, col)
        puts "Player #{player} wins the game."
        display
        break
      end

      @move_hash[col] -= 1

      display

      player = switch_player(player)
      turn += 1
    end
  end

  private

  def win_cell_count(row, col, i, j, player)
    count = 0
    
    (1..3).each do |k|
      valid = (col + (j*k) >= 0) &&
              (col + (j*k) < @c_size ) &&
              (row + (i*k) >= 0) &&
              (row + (i*k) < @r_size) &&
              (@grid[row + (i*k)][col + (j*k)] == player)

      break if !valid
      count += 1
    end

    count
  end  

  # T = O(1)
  def is_winner?(player, row, col)
    return true if win_cell_count(row, col, -1,  0, player) + win_cell_count(row, col,  1,  0, player) >= 3 
    return true if win_cell_count(row, col,  0, -1, player) + win_cell_count(row, col,  0,  1, player) >= 3 
    return true if win_cell_count(row, col, -1,  1, player) + win_cell_count(row, col,  1, -1, player) >= 3 
    return true if win_cell_count(row, col,  1,  1, player) + win_cell_count(row, col, -1, -1, player) >= 3 
  end

  def get_valid_input
    ch = gets
    
    if invalid_col?(ch)
      while invalid_col?(ch)
        puts "Invalid Input: Try a free column between 0 and 6"
        ch = gets
      end
    end
      
    ch[0].to_i
  end

  def invalid_col?(str)
    return true if (str.size > 2) || (str[0] < '0') || (str[0] > '6')
   
    col = str[0].to_i

    @move_hash[col] < 0
  end

  def switch_player(player)
    (player == 1) ? 2 : 1
  end

  # T = O(m*n)
  def display
    m = @grid.size
    n = @grid.first.size

    puts "--------------------------------"
    puts "| 0 | 1 | 2 | 3 | 4 | 5 | 6 |"
    puts "--------------------------------"
    puts "--------------------------------"

    (0..(m-1)).each do |i|
      str = "| "
      (0..(n-1)).each do |j|
        str += @grid[i][j].to_s + " | "
      end
      puts str
    end
    
    puts "--------------------------------"
  end
end

class Computer
  def initialize(grid, move_hash)
    @hash = {}
    @grid = grid
    @move_hash = move_hash
    
    @r_size = m = grid.size
    @c_size = n = grid.first.size

    (0..(n-1)).each do |i|
      @hash[i] = m-1
    end
  end

  def grid_clone
    arr = []

    @grid.each { |g| arr << g.dup }

    arr
  end

  def get_turn_mini_max
    _, max_col = mini_max(Connect4::AI, Connect4::HUMAN, grid_clone, @move_hash.dup, 3)
    max_col
  end

  def mini_max(player, op_player, grid, mh, depth)
    return [0, -1] if depth == 0

    n = grid.first.size
    max_score = -Float::INFINITY
    max_col = -1

    (0..(n - 1)).each do |col|
      row = mh[col]

      next if row == -1

      grid[row][col] = player
      mh[col] -= 1

      curr_score = score(row, col, player, op_player, grid)

      mini_max_score, _  = mini_max(op_player, player, grid, mh, depth - 1)

      grid[row][col] = Connect4::EMPTY
      mh[col] += 1

      if (curr_score - mini_max_score) > max_score
        max_score = curr_score - mini_max_score
        max_col = col
      end
    end

    (max_score == -Float::INFINITY) ? [0, -1] : [max_score, max_col]
  end

  def get_turn_ai(player, op_player, grid, move_hash)
    max_score = -Float::INFINITY
    max_col = -1

    (0..(@c_size - 1)).each do |col|
      row = move_hash[col]

      next if row == -1

      curr_score = score(row, col, player, op_player, grid)
      
      if curr_score > max_score
        max_score =  curr_score
        max_col = col 
      end
    end

    max_col
  end
  
  def score(row, col, player, op_player, grid)
    score = -Float::INFINITY

    [[0, 1],[0, -1],[1, 0],[-1, 0], [1,1],[-1,-1], [1, -1],[-1, 1]].each do |i, j|
      score = [score, cal_score_for(row, col, i, j, player, op_player, grid)].max
    end

    score
  end

  def cal_score_for(row, col, i, j, player, op_player, grid)
    m = grid.size
    n = grid.first.size

    p_count = e_count = o_count = 0

    (1..3).each do |k|
      break if (col + (j*k) >= n) || (col + (j*k) < 0) || (row + (i*k) >= m) || (row + (i*k) < 0)

      case grid[row + (i*k)][col + (j*k)]
      when player
        p_count += 1
      when Connect4::EMPTY
        e_count += 1
      when op_player
        o_count += 1
      end
    end

    eval(p_count, e_count, o_count)
  end

  def eval(p_count, e_count, o_count)
    score = 0

    if p_count == 3
      score = 1001
    elsif (p_count == 2 && e_count == 1) || (p_count == 2)
      score = 600
    elsif (p_count == 1 && e_count == 2) || (p_count == 1)
      score = 101
    elsif e_count == 3
      score = 80
    elsif p_count == 2 && o_count == 1
      score = 51
    elsif p_count == 1 && o_count == 2
      score = 50
    elsif (o_count == 1 && e_count == 2) || (o_count == 1)
      score = 100
    elsif (o_count == 2 && e_count == 1) || (o_count == 2)
      score = 500
    elsif o_count == 3
      score = 1000
    end

    score
  end
end

connect_4 =  Connect4.new
connect_4.play

# Suppose, the grid is huge and it is hard to keep the whole grid into memory. How can we scale this system?
# Use data sharding using row_id as partition_key and thereby distribute the grid into multiple nodes which are 
# using consistent hashing
