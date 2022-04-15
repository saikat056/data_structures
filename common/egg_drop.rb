n = 5, k = 3

         k->
       1  2  3
 i: 1  1  1. 1
    2. 2
    3. 3
    4. 4
    5. 5
    
    5-
    4-
    3- p
    2-
    1-
    
    m[i][j] =         min       { [m[i-p][j], m[p-1][j-1]].max + 1 }
              1 <= p <= (i-1) 
    
    m[n][1] = n
    m[1][k] = 1
    
def super_egg_drop(k, n)
  m = Array.new(n+1) { Array.new(k+1) { 0 }}
  
  (1..n).each do |i|
    m[i][1] = i
  end
  
  (1..k).each do |j|
    m[1][j] = 1
  end
  
  # T = O(n*k*n) = O(n^2*k)
  (2..n).each do |i|
    (2..k).each do |j|
      min_so_far = Float::INFINITY
      
      # T= O(n)
      (1..(i-1)).each do |p|
        min_so_far = [([m[i-p][j], m[p-1][j-1]].max + 1), min_so_far].min
      end
      
      m[i][j] = min_so_far
    end
  end
  
  m[-1][-1]  
end

Time
----
  T = O(n^2 * k)
 
 Space
 -----
  S = O(n*k)
