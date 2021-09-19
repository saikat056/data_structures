Input: s = "aab", p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
  
       v 
    i: 0 1 2   
  s = "a a b"

  j:   0 1 2 3 4
  p = "c * a * b"
           ^
  
   v
  "a a"

  "a *"
   ^
  
   V
  "a "
  "a b *"
   ^
  
def is_match(s, p)
  cache = {}
  dfs(s, p, 0, 0, cache)
end

def dfs(s, p, i, j, cache)
  return cache[[i,j]] if !cache[[i,j]].nil?
  
  return true if (i >= s.size) && (j >= p.size)
  
  return false if j >= p.size
    
  match = (i < s.size) && ((s[i] == p[j]) || (p[j] == '.'))
  
  if match
    if (j+1 < p.size) && p[j+1] == '*'
      cache[[i,j]] = dfs(s, p, i+1, j+2, cache) || dfs(s, p, i+1, j, cache) || dfs(s, p, i, j+2, cache)
    else
      cache[[i,j]] = dfs(s, p, i+1, j+1, cache)
    end
  else
    if p[j+1] == '*'
      cache[[i,j]] = dfs(s, p, i, j+2, cache)
    else
      cache[[i,j]] = false
    end
  end
  
  cache[[i,j]]
end
