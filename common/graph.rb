load 'queue.rb'

class State
  UNVISITED = 1
  VISITING = 2
  VISITED = 3
end

class Node
  attr_accessor :value, :state
  def initialize(v)
    @value = v
    @state = State::UNVISITED
  end

  def visited?
    @state == State::VISITED
  end

  def unvisited?
    @state == State::UNVISITED
  end

  def visiting?
    @state == State::VISITING
  end
end

class Graph
  attr_accessor :vertices, :edges
  def initialize()
    @vertices = []
    @edges = {}
    populate
  end

  def populate
    6.times{|value| vertices.push(Node.new(value))}
    edges[0] = [vertices[1], vertices[2]]
    edges[1] = [vertices[2],vertices[3], vertices[4]]
    edges[2] = [vertices[3], vertices[4]]
    edges[3] = []
    edges[4] = [vertices[5], vertices[3]]
    edges[5] = [vertices[0]]
  end

  def get_edges(node)
    return nil if node.nil?
    edges[node.value]
  end

  def find_route_using_dfs(source, dist)
    return true if source.value == dist.value
    return false if get_edges(source).nil?
    is_found = false
    source.state = State::VISITING
    get_edges(source).each{|node| is_found |= find_route_using_dfs(node, dist) if node.unvisited? }
    source.state = State::VISITED
    return is_found
  end

  def find_route_using_bfs(source, dist)
    return true if source.value == dist.value
    return false if get_edges(source).nil?
    queue = Queue.new
    is_found = false
    queue.enqueue(source)
    while !queue.is_empty? do
      node = queue.dequeue
      return true if node.value == dist.value
      node.state = State::VISITED
      get_edges(node).each do |x|
        x.state = State::VISITING
        queue.enqueue(x)
      end
    end
    return is_found
  end
end

