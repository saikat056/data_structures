

#min number of coins required
coins = [1,2,5]
n = 10

     i = 3
 coins = [1,  2,  5]
       j: 0   1   2
          ^
 min_count = 2
          cache[3] + 1, cache[2] + 1

          0 1  2  3  4    n
cache = [ 0 1  1  2  2   -1]

def coin_change(coins, n)
  # S = O(n)
  cache = Array.new(n+1) { -1 }
  cache[0] = 0

  # O(n)
  (1..n).each do |i|
    min_count = Float::INFINITY

    # O(m), m is size of coins
    (0..(coins.size - 1)).each do |j|
      if i >= coins[j]
        min_count = [ cache[i - coins[j]] + 1, min_count].min
      end
    end

    cache[i] = min_count
  end

  return -1 if cache[n] == Float::INFINITY

  cache[n]
end


Time
-----
  T = O(m*n)

Space
-----
  m = size of coins
  n = the number to be changed by coins
  S = O(m) + O(n) = O(n), if n >> m
