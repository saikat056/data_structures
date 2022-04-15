arr = [['usd', 'yen', 100, 105],['usd', 'btc', 42088, 42120], ['euro', 'btc', 35601, 35610], ['euro', 'yen', 129.43, 129.45]]

queries = [['usd','yen'], ['usd', 'x'], ['usd', 'btc']]

# best bid quote for a client is the max bid rate for curr1/curr2
# result = [['usd','yen', 2, 5], ['usd', 'x', 5, 7]]
# (usd/btc)*(btc/euro)*(euro/yen) = [12*(1/45)*(1/59) , 14*(1/23)*(1/34)] = [0.0045, 0.017]
#
# Time
# n = arr.size
# m = queries
# Worst case, |V| = |E| = O(n)
# Total, T = O(n) + O(m*n) = O(m*n)
#
# Space
# S = O([n,m].max)
# S = O(n) if n > m
def cal_quote(arr, queries)
  # S = O(n), number of edges
  hash = {}

  # T = O(n)
  arr.each do |elem|
    hash[elem[0]] ||= []

    # array insertion for dynamic array: amortized O(1)
    hash[elem[0]] << [elem[1], elem[2]]

    hash[elem[1]] ||= []
    hash[elem[1]] << [elem[0], (1.to_f / elem[3])]
  end

  result = []

  # T = O(m*n)
  # S = O(n)
  queries.each do |q|
    start, stop = q
    # S = O(n)
    visited = {}
    visited[start] = true
    rate = []
    
    # O(n)
    dfs(hash, rate, start, start, 1, stop, visited)
    result << (rate.empty? ? [start, stop, -1] : [start, stop, rate[0]])
  end

  # S = O(m)
  result
end

# T = O(n), total number of edges in the graph
# S = O(n), n number of calls in call-stack in worst case
def dfs(hash, rate, start, curr, running_bid, stop, visited)
  return if hash[curr].nil?

  if curr == stop
    if rate.empty?
      rate << running_bid
    else
      if running_bid > rate[0]
        rate[0] = running_bid
      end
    end

    return
  end


  hash[curr].each do |elem|
    c, bid, ask = elem

    if !visited[c]
      visited[c] = true
      dfs(hash, rate, start, c, bid*running_bid, stop, visited)
      visited[c] = false
    end
  end
end

result = cal_quote(arr, queries)
result.each do |r|
  puts "Base: #{r[0]}, Quote: #{r[1]}, Bid: #{r[2]}"
  puts '==============================='
end
