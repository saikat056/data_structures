arr = [['usd', 'yen', 100, 102],['usd', 'btc', 42088, 42120], ['euro', 'btc', 35601, 35610], ['euro', 'yen', 129.43, 129.45]]

# best spread rate = min spread rate for a client
# n = arr.size
# worst-case |E| = 2*|V| = O(n)
# Total Time, T = O(n)
# Total Space, S = O(n)
def best_spread_rate(arr, start, stop)
  # S = O(n)
  rate_h = {}

  # T = O(n)
  arr.each do |elem|
    base, second, bid, ask = elem

    rate_h[base] ||= []
    rate_h[base] << [second, bid, ask]

    rate_h[second] ||= []
    rate_h[second] << [base, (1.to_f / ask), (1.to_f / bid)]
  end

  result = []
 
  # S = O(n)
  visited = {}
  visited[start] = true

  # T = O(|E|) =  O(n)
  # S = O(n) =  size of call-stack
  dfs(start, start, stop, 1, 1, rate_h, result, visited, [start])

  # O(1)
  result
end

def dfs(start, curr, stop, run_bid, run_ask, rate_h, result, visited, path)
  if curr == stop
    if result.empty?
      result << [run_bid, run_ask, path.dup]
    else
      pre_bid, pre_ask = result[0]

      if (run_ask - run_bid).abs < (pre_ask -  pre_bid).abs
        result[0] = run_ask
        result[1] = run_bid
        result[2] = path.dup
      end
    end

    return
  end
  
  if rate_h[curr]
    rate_h[curr].each do |elem|
      next_node, bid, ask = elem

      if !visited[next_node]
        visited[next_node] =  true
        path << next_node
        dfs(start, next_node, stop, bid*run_bid, ask*run_ask, rate_h, result, visited, path)
        path.pop
        visited[next_node] =  false
      end
    end
  end
end

#puts best_spread_rate(arr, 'usd', 'yen')
puts best_spread_rate(arr, 'usd', 'x')
