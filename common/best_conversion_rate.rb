arr = [['usd', 'btc', 42088, 42120], ['euro', 'btc', 35601, 35610], ['euro', 'yen', 129.43, 129.45]]

queries = [['usd','yen'], ['usd', 'x'], ['usd', 'btc']]

# result = [['usd','yen', 2, 5], ['usd', 'x', 5, 7]]
# (usd/btc)*(btc/euro)*(euro/yen) = [12*(1/45)*(1/59) , 14*(1/23)*(1/34)] = [0.0045, 0.017]
#
def cal_quote(arr, queries)
  hash = {}

  arr.each do |elem|
    hash[elem[0]] ||= []
    hash[elem[0]] << [elem[1], elem[2], elem[3]]

    hash[elem[1]] ||= []
    hash[elem[1]] << [elem[0], (1.to_f / elem[3]), (1.to_f / elem[2])]
  end

  result = []

  queries.each do |q|
    start, stop = q
    visited = {}
    visited[start] = true
    rate = dfs(hash, result, start, start, 1, 1, stop, visited)
    result << (rate.nil? ? [start, stop, -1, -1] : rate)
  end

  result
end

def dfs(hash, result, start, curr, running_bid, running_ask, stop, visited)
  return nil if hash[curr].nil?

  return [start, stop, running_bid, running_ask]   if curr == stop


  hash[curr].each do |elem|
    c, bid, ask = elem

    if !visited[c]
      visited[c] = true
      rate = dfs(hash, result, start, c, bid*running_bid, ask*running_ask, stop, visited)
      return rate if rate
    end
  end
  
  nil
end

result = cal_quote(arr, queries)
result.each do |r|
  puts "Base: #{r[0]}, Quote: #{r[1]}, Bid: #{r[2]}, Ask: #{r[3]}"
  puts '==============================='
end
