
def swim_in_water(grid)
   m = grid.size
   n = grid.first.size
   
   m_h = MinHeap.new
   
   t = -Float::INFINITY
   
   # S = O(m*n * log(m*n)) 
   visited = {}
   m_h.push([grid[0][0],0,0])
   
   while !m_h.empty? do
     cell = m_h.extract_min
     
     t = [t, cell[0]].max
     
     if (cell[1] == (m - 1)) && (cell[2] == (n - 1))
        return t
     end
     
     visited[[cell[1], cell[2]]] = true
      
     i = cell[1] + 1
     j = cell[2]
     node = [grid[i][j], i, j]
     m_h.push(node) if (i < m) && !visited[[i, j]]
     
     i = cell[1] - 1
     j = cell[2]
     node = [grid[i][j], i, j]
     m_h.push(node) if (i >= 0) && !visited[[i, j]]
     
     i = cell[1]
     j = cell[2] + 1
     node = [grid[i][j], i, j]
     m_h.push(node) if  (j < n) && !visited[[i, j]]
     
     i = cell[1]
     j = cell[2] - 1
     node = [grid[i][j], i, j]
     m_h.push(node) if (j >= 0) && !visited[[i, j]]
   end
    
   return nil
end

# Time
# T = O(m*n*log(m*n))
# if m == n
# T = O(n^2 * log(n^2)) = O(n^2 * 2* log(n)) = O(n^2 * log(n))

# Space
# S = O(m*n)
