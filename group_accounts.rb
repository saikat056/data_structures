Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]


email_hash = {1: "johnsmith@mail.com", 2: "john_newyork@mail.com", 3: "john00@mail.com"}
name_hash = { 1: "John", 2: "John", 3: "John"}
email_index_hash = {"johnsmith@mail.com": 1, "john_newyork@mail.com": 2, "john00@mail.com": 3,}

           0,  1,  2,  3,  4
a_set = {nil, -3,  1,  1, -1}

def accounts_merge(accounts)
  return [] if accounts.empty?

  email_hash = {}
  name_hash  = {}
  email_index_hash = {}
  
  # O(A)
  e_count = 1
  accounts.each do |acc|
    name = acc[0]
    
    (1..(acc.size-1)).each do |index|
      email = acc[index]
      
      if email_index_hash[email].nil?
        email_hash[e_count] = email
        name_hash[e_count] = name
        email_index_hash[email] = e_count
        e_count += 1
      end
    end
  end
  
  a_set = Array.new(email_hash.keys.size + 1) { -1 }
  a_set[0] = nil
  
  accounts.each do |acc|
    (1..(acc.size-2)).each do |index|
      email_1 = acc[index]
      email_2 = acc[index + 1]
      
      email_1_index = email_index_hash[email_1]
      email_2_index = email_index_hash[email_2]
      
      email_1_root = find(a_set, email_1_index)
      email_2_root = find(a_set, email_2_index)
      
      # path compression
      a_set[email_1_index] = email_1_root if a_set[email_1_index] > 0 
      a_set[email_2_index] = email_2_root if a_set[email_2_index] > 0
      
      if (email_1_root != email_2_root)
        # rank union of sets
        if (a_set[email_1_root] > a_set[email_2_root])
          email_1_root, email_2_root = [email_2_root, email_1_root]
        end
        
        a_set[email_1_root] += a_set[email_2_root]
        a_set[email_2_root] = email_1_root
      end
    end
  end
  
  result_hash = {}
  
  (1..(a_set.size-1)).each do |i|
    root = find(a_set, i)
    
    if result_hash[root].nil?
      result_hash[root] = []
    end
    
    result_hash[root] << email_hash[i]
  end
  
  result_hash.keys.each { |key| result_hash[key].sort! }
  
  result_hash.keys.map do |key|
    [name_hash[key]] + result_hash[key]
  end
end

def find(a_set, index)
  while(a_set[index] > 0)
    index = a_set[index]
  end
  
  index
end

Time complexity

A = sum(acc_size_i) where, 0 <= i < accounts.size

With path compression and union by rank, set operation takes amortized constant time,
i.e, O(1)

T = O(A*O(1)) ~ O(A)


Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]


set_to_name = { 1: "John", 2: "Mary", 3: "John" }
set_to_email = { 1: ["johnsmith@mail.com", "john_newyork@mail.com"]}
email_to_vertex = {"johnsmith@mail.com" : v1, }


           0,  1,  2,  3,  4
a_set = {nil, -3,  1,  1, -1}

class Node
  attr_accessor :name, :email, :neighbors
  
  def initialize(n, e)
    @name = n
    @email = e
    @neighbors = {}
  end
end

def accounts_merge(accounts)
  return [] if accounts.empty?
  
  email_to_vertex = {}
  
  accounts.each do |acc|
    name = acc[0]
    (1..(acc.size-1)).each do |index|
      email = acc[index]
       
      email_to_vertex[email] = Node.new(name, email)  if email_to_vertex[email].nil?
    end
  end
  
  accounts.each do |acc|
    (1..(acc.size-2)).each do |index|
      email_1 = acc[index]
      vertex_1 = email_to_vertex[email_1]
      
      email_2 = acc[index + 1]
      vertex_2 = email_to_vertex[email_2]
      
      vertex_1.neighbors[vertex_2] = true if vertex_1 != vertex_2
    end
  end
  
  vertices = email_to_vertex.values
  
  visited = {}
  set_count = 1
  set_to_name = {}
  set_to_email = {}
  
  vertices.each do |vertex|
    if visited[vertex].nil?
      dfs(vertex, set_count, set_to_name, set_to_email, visited)
      set_count += 1
    end
  end
  
  set_to_name.keys.map do |key|
    [set_to_name[key]] + set_to_email[key].sort!
  end
end

def dfs(vertex, set_count, set_to_name, set_to_email, visited)
  stack  = []
  stack.push(vertex)
  
  while(stack.size != 0) do
    v = stack.pop
    visited[v] = true
    set_to_name[set_count] = v.name if set_to_name[set_count].nil?
  
    set_to_email[set_count] = [] if set_to_email[set_count].nil?
    
    set_to_email[set_count] << v.email
    
    v.neighbors.keys.each { |key| stack.push(key) }
  end
  
end

# Test
accounts = []
result = []

Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]

email_to_vertex = {"johnsmith@mail.com" : v1, "john_newyork@mail.com": v2, "john00@mail.com": v3,  "mary@mail.com": v4, "johnnybravo@mail.com": v5}

# forest
     s1       s2  s3
   v1--- v2   v4  v5
   |
   +---- v3

   set: s1, s2, s3
