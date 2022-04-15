# Circus tower. An array of height and weight of people are given. We need to find out the longest sequence of people with non-increasing order of height and weights.
        h w  
arr = [[1,3],[5,4],[4,2],[2,2]]
arr = [[5,4],[4,2],[2,2],[1,3]]

best_seq = [[5,4],[4,2]]
i = 0, 1, 2
sols = {0: [[5,4]], 1: [[5,4],[4,2]]}

result = [[5,4],[4,2],[2,2]]

           0     1.    2.    3
arr = [[5,4],[4,2],[2,2],[1,3]]

def circus_order(arr)
  # O(n*log(n))
  # S = O(n)
  arr = arr.sort_by{ |x| [-x[0], -x[1]]}
  
  # S = O(n^2)
  sols = {}
  
  best_seq = []
  
  # T = O(n^2)
  # T = 1+2+3+...+n = O(n^2)
  (0..(arr.size - 1)).each do |i|
    sols[i] = find_bs_at_i(arr, i, sols)
    best_seq = sols[i] if sols[i].size > best_seq.size
  end
  
  best_seq
end

def find_bs_at_i(arr, i, sols)
  return [arr[i]] if i == 0
  
  bs = [arr[i]]
  
  (0..(i - 1)).each do |j|
    last = sols[j][-1] 
    
    if (last[1] >= arr[i][1]) && (bs.size < (sols[j].size + 1))
      bs = sols[j].dup + [arr[i]]
    end
  end
  
  bs
end

Time
----
  T = O(n^2)
  
Space
-----
  S = O(n^2)
  hash = 1+2+3+..+n = O(n^2)
Test
-----
          v.    v.    v.    v
arr = [[5,4],[4,2],[2,2],[1,3]]
i = 2

