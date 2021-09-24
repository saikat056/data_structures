equations = [["cad","usd"],["usd","btc"]]
values = [2.0,3.0]
queries = [["cad","btc"],["usd","cad"],["cad","e"],["cad","cad"],["x","x"]]

def calc_equation(equations, values, queries)
  hash = {}
  n = equations.size

  (0..(n-1)).each do |i|
    elem =  equations[i]
    hash[elem[0]] ||= [] 
    hash[elem[0]] << [elem[1], values[i]]

    hash[elem[1]] ||= [] 
    hash[elem[1]] << [elem[0], (1.to_f / values[i])]
  end

  result = []

  queries.each do |q|
    result << bfs(hash, q)
  end

  result
end

def bfs(hash, query)
  start = query[0]
  stop = query[1]
  visited = {}

  return -1 if hash[start].nil?
  return 1 if start == stop 

  queue = []
  queue<< [start, 1]
  visited[start] = true

  while !queue.empty? do
    elem, con_rate = queue.shift

    if hash[elem]
      hash[elem].each do |j|
        next_node, rate = j

        return con_rate*rate if next_node == stop

        if !visited[next_node]
          visited[next_node] = true
          queue << [next_node, con_rate * rate ]
        end
      end
    end
  end
  
  -1
end

puts calc_equation(equations, values, queries)

