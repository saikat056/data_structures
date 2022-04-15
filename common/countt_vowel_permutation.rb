# @param {Integer} n
# @return {Integer}
def count_vowel_permutation(n)
  a_count = e_count = o_count = u_count = i_count = 1
    
  mod = 10**9  + 7
    
  (1..(n-1)).each do |i|
     a_count_new = (e_count + u_count + i_count) % mod
     e_count_new = (a_count + i_count) % mod
     o_count_new = i_count % mod
     u_count_new = (o_count + i_count) % mod
     i_count_new = (e_count + o_count) % mod
      
     a_count = a_count_new
     e_count = e_count_new
     o_count = o_count_new
     u_count = u_count_new
     i_count = i_count_new
  end
    
  (a_count + e_count + o_count + u_count + i_count) % mod
    
end
