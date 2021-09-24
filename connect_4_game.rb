class Connect4
  def initialize
    @r_size = m = 6
    @c_size = n = 7

    # S = O(m*n)
    @grid = Array.new(m) { Array.new(n) { 0 } }
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
    computer = Computer.new(@grid)
    last = [0,0]

    # T = O(m*n)
    while(turn < (@r_size*@c_size)) do
      puts "Player #{player}'s trun: (0-6)" 

      if player == 1
        col = get_valid_input
      else
        col = computer.get_turn(last[0], last[1])
      end

      row = @move_hash[col]

      @grid[row][col] = player

      if is_winner?(player, row, col)
        puts "Player #{player} wins the game."
        display
        break
      end

      @move_hash[col] -= 1

      display

      last = [row, col]
      player = switch_player(player)
      turn += 1
    end
  end

  private

  # T = O(1)
  def is_winner?(player, row, col)
    m = @r_size
    n = @c_size

    l_count = 0
    r_count = 0

    (1..3).each do |i|
      break unless (col + i < n ) && (@grid[row][col + i] == player)
      r_count += 1
    end

    (1..3).each do |i|
      break unless (col - i >= 0 ) && (@grid[row][col - i] == player)
      l_count += 1
    end

    return true if r_count + l_count >= 3 

    u_count = 0
    d_count = 0

    (1..3).each do |i|
      break unless (row - i >= 0 ) && (@grid[row - i][col] == player)
      u_count += 1
    end

    (1..3).each do |i|
      break unless (row + i < m ) && (@grid[row + i][col] == player)
      d_count += 1
    end

    return true if u_count + d_count >= 3 

    ur_count = 0
    dl_count = 0

    (1..3).each do |i|
      break unless (row - i >= 0 ) && (col + i < n ) && (@grid[row - i][col + i] == player)
      ur_count += 1
    end

    (1..3).each do |i|
      break unless (row + i < m )  && (col - i >= 0) && (@grid[row + i][col - i] == player)
      dl_count += 1
    end

    return true if ur_count + dl_count >= 3 

    ul_count = 0
    dr_count = 0

    (1..3).each do |i|
      break unless (row - i >= 0 ) && (col - i >= 0 ) && (@grid[row - i][col - i] == player)
      ul_count += 1
    end

    (1..3).each do |i|
      break unless (row + i < m )  && (col + i < n) && (@grid[row + i][col + i] == player)
      dr_count += 1
    end

    return true if ul_count + dr_count >= 3 
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
  def initialize(grid)
    @hash = {}
    @grid = grid
    
    @r_size = m = grid.size
    @c_size = n = grid.first.size

    (0..(n-1)).each do |i|
      @hash[i] = m-1
    end
  end

  def get_turn(row, col)
    m = @r_size
    n = @c_size
    
    if row + 1 < m
      if @grid[row + 1][col] == 1
        return col
      else
        if (col - 1 >= 0) && (@grid[row][col - 1] == 1)
          return col + 1 if col + 1 < n
        else
          return col - 1 if col - 1 >= 0
        end
      end
    elsif row == m - 1
      if (col - 1 >= 0) && (@grid[row][col - 1] == 1)
        return col + 1 if col + 1 < n
      else
        return col - 1 if col - 1 >= 0
      end
    end

    (0..(n-1)).each do |i|
      return i if @grid[0][i] == 0
    end
  end
end

connect_4 =  Connect4.new
connect_4.play

# Suppose, the grid is huge and it is hard to keep the whole grid into memory. How can we scale this system?
# Use data sharding using row_id as partiition_key and thereby distribute the grid into multiple nodes which are 
# using consistent hashing
