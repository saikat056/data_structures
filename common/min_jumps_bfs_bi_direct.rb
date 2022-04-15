# @param {Integer[]} arr
# @return {Integer}
def min_jumps(arr)
  n = arr.size
  
  hash = {}
  (0..(n-1)).each do |i|
    hash[arr[i]] ||= []
    hash[arr[i]] << i
  end

  q = []
  visited = {}
  q << [0, 0]

  r_q = []
  r_v = {}
  r_q << [n-1,0]

  while !q.empty? && !r_q.empty? do
    index, d = q.shift
    visited[index] = true
    
    return d if index == n-1
    
    q << [index + 1, d + 1] if (index + 1 <  n) && !visited[index+1]
    q << [index - 1, d + 1] if (index - 1 >= 0) && !visited[index-1]
    
    hash[arr[index]].reverse_each do |k|
      if index != k
        q << [k, d + 1] if !visited[k]
      end
    end
    
    index, d = r_q.shift
    r_v[index] = true
    
    return d if index == 0
    
    r_q << [index + 1, d + 1] if (index + 1 <  n) && !r_v[index+1]
    r_q << [index - 1, d + 1] if (index - 1 >= 0) && !r_v[index-1]
    
    hash[arr[index]].reverse_each do |k|
      if index != k
        r_q << [k, d + 1] if !r_v[k]
      end
    end
  end

  -1
end
