# https://leetcode.com/problems/find-latest-group-of-size-m/
arr = [3,5,1,2,4],
m = 1 
         0   1  2   3  4   5
s.   =  "0   0  0   0  0   0"
set. =   n. -1  n  -1  n. -1  
                ^
curr =  3
left =  2
right = 4

def find_latest_step(arr, m)
  n1 = arr.size
  st = '0'*(n1+1)
  
  set = Array.new(n1+1) { nil }
  
  count = 0
  latest = -1
  
  (0..(n1 - 1)).each do |i|
    curr = arr[i]
    left = curr - 1
    right = curr + 1      

    if (left >= 0) && (st[left] == '1')
      r = root_of(set, left)

      count -= 1 if set[r].abs == m
        
      find_union(set, curr, left)
    end
    
    if (right < n1+1) && (st[right] == '1')
      r = root_of(set, right)

      count -= 1 if set[r].abs == m

      find_union(set, curr, right)
    end
      
    set[curr] = -1 if set[curr].nil?
      
    r = root_of(set, curr)
      
    count += 1 if set[r].abs == m
      
    latest = i + 1 if count > 0
    
    st[curr] = '1'
  end
  
  latest
end

def root_of(set, i)
  while (set[i] >= 0) do
    i = set[i]
  end
  i
end

def find_union(set, i, j)
  set[i] = -1 if set[i].nil?
  set[j] = -1 if set[j].nil?
  
  r1 = root_of(set, i)
  r2 = root_of(set, j)

  if set[r1] <= set[r2]
    c = set[r1] + set[r2]
    set[r1] = c
    set[r2] = r1
  else
    c = set[r1] + set[r2]
    set[r2] = c
    set[r1] = r2
  end
end
