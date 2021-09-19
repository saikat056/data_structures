# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  cache = {}
  dfs(s, p, 0, 0, cache)
end

def dfs(s, p, i, j, cache)
  return cache[[i,j]] if !cache[[i,j]].nil?
  
  return true if (i >= s.size) && (j >= p.size)
  
  return false if j >= p.size
    
  if i < s.size
     if (s[i] == p[j]) || (p[j] == '?')
       cache[[i,j]] =  dfs(s, p, i+1, j+1, cache)
     elsif p[j] == '*'
       cache[[i,j]] =  dfs(s, p, i+1, j+1, cache) || dfs(s, p, i+1, j, cache) || dfs(s, p, i, j+1, cache)
     else
       cache[[i,j]] = false
     end
  else
    if p[j] == '*'
      cache[[i,j]] =  dfs(s, p, i, j+1, cache)
    else
      cache[[i,j]] = false
    end
  end
  
  cache[[i,j]]
end
