arr = [['usd', 'yen', 100, 102],['usd', 'btc', 42088, 42120], ['euro', 'btc', 35601, 35610], ['euro', 'yen', 129.43, 129.45]]

arr = [["XTZ", "USD", "0.9999", "1.0002"], ["UMA", "GBP", "0.9999", "1.0002"], ["DOGE", "USDT", "0.9999", "1.0002"], ["FORTH", "EUR", "0.9999", "1.0002"], ["ICP", "USDT", "0.9999", "1.0002"], ["FIL", "GBP", "0.9999", "1.0002"], ["GRT", "GBP", "0.9999", "1.0002"], ["BOND", "USD", "0.9999", "1.0002"], ["USDT", "USDC", "0.9999", "1.0002"], ["RAD", "EUR", "0.9999", "1.0002"], ["RLY", "GBP", "0.9999", "1.0002"], ["BTC", "EUR", "0.9999", "1.0002"], ["WLUNA", "GBP", "0.9999", "1.0002"], ["AAVE", "EUR", "0.9999", "1.0002"], ["BAND", "USD", "0.9999", "1.0002"], ["RLC", "BTC", "0.9999", "1.0002"], ["FET", "USDT", "0.9999", "1.0002"], ["IOTX", "USD", "0.9999", "1.0002"], ["SOL", "USDT", "0.9999", "1.0002"], ["XLM", "BTC", "0.9999", "1.0002"], ["UST", "EUR", "0.9999", "1.0002"], ["ZEN", "USD", "0.9999", "1.0002"], ["UNI", "BTC", "0.9999", "1.0002"], ["OMG", "BTC", "0.9999", "1.0002"], ["MATIC", "EUR", "0.9999", "1.0002"], ["GTC", "USD", "0.9999", "1.0002"], ["LTC", "USD", "0.9999", "1.0002"], ["QUICK", "USD", "0.9999", "1.0002"], ["COMP", "USD", "0.9999", "1.0002"], ["WLUNA", "BTC", "0.9999", "1.0002"], ["ZEC", "USDC", "0.9999", "1.0002"], ["TRIBE", "USD", "0.9999", "1.0002"], ["POLY", "USD", "0.9999", "1.0002"], ["DOT", "EUR", "0.9999", "1.0002"], ["MANA", "USDC", "0.9999", "1.0002"], ["AXS", "USD", "0.9999", "1.0002"], ["SKL", "GBP", "0.9999", "1.0002"], ["ICP", "EUR", "0.9999", "1.0002"], ["ANKR", "GBP", "0.9999", "1.0002"], ["LINK", "EUR", "0.9999", "1.0002"], ["LOOM", "USDC", "0.9999", "1.0002"], ["XTZ", "GBP", "0.9999", "1.0002"], ["BAL", "BTC", "0.9999", "1.0002"], ["CVC", "USDC", "0.9999", "1.0002"], ["OMG", "GBP", "0.9999", "1.0002"], ["BTRST", "EUR", "0.9999", "1.0002"], ["FET", "USD", "0.9999", "1.0002"], ["MASK", "GBP", "0.9999", "1.0002"], ["FIL", "BTC", "0.9999", "1.0002"], ["BCH", "EUR", "0.9999", "1.0002"], ["WBTC", "BTC", "0.9999", "1.0002"]]

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
    rate_h[base] << [second, bid.to_f, ask.to_f]

    rate_h[second] ||= []
    rate_h[second] << [base, (1.to_f / ask.to_f), (1.to_f / bid.to_f)]
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
      result << run_bid
      result << run_ask
      result << path.dup
    else
      pre_bid, pre_ask, _  = result

      if (run_ask - run_bid).abs < (pre_ask -  pre_bid).abs
        result[0] = run_bid
        result[1] = run_ask
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

# puts best_spread_rate(arr, 'usd', 'yen')
require 'uri'
require 'net/http'
require 'json'

uri = URI('https://api.pro.coinbase.com/products')
res = Net::HTTP.get_response(uri)

products = {}

response_json = JSON.parse(res.body)

response_json.take(1000).each do |elem|
  products[elem['id']] ||= [elem['base_currency'], elem['quote_currency']]
end

res = Net::HTTP.get_response(uri)

responses = {}
threads = []
products.keys.each do |product_key|
  uri = URI("https://api.pro.coinbase.com/products/#{product_key}/book")

  thread = Thread.new do
    responses[product_key] = Net::HTTP.get_response(uri)
  end

  threads << thread
end

threads.each(&:join)

responses.map do |key, res|
  response_json = JSON.parse(res.body)
  
  unless res.is_a?(Net::HTTPSuccess)
    products.delete(key)
    next
  end

  products[key] << response_json['bids'].first.first
  products[key] << response_json['asks'].first.first
end

arr = products.values.compact

puts best_spread_rate(arr, arr[0][0], arr[-1][0])
