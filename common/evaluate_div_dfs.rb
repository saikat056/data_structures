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
    start, stop = q

    visited = {}
    visited[start] = true

    result << dfs(hash, start, stop, 1, visited)
  end

  result
end

def dfs(hash, start, stop, con, visited)
  return -1 if hash[start].nil?
  return con if start == stop

  if hash[start]
    hash[start].each do |j|
      new_node, c = j

      if !visited[new_node]
        visited[new_node] = true

        value = dfs(hash, new_node, stop, c * con, visited)

        return value if value != -1
      end
    end
  end

  -1
end

puts calc_equation(equations, values, queries)

