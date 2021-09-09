n = 4
h = [1, 1, 2, 3]
d = [1, 2, 1, 100]
b = 8

#####
n = 4
h = [1, 1, 2, 100]
d = [1, 2, 1, 3]
b = 8

#####
n = 3
h = [2, 1, 4]
d = [3, 1, 2]
b = 4

sec_exist = 2/4 = 0.5
t_damage = 0.5 * 3 = 1.5

sec_exist = 1/4 = 0.25
t_damage = 0.25 * 1 = 0.25
w_d = [[1.5, 0.5, 3], [0.25, 0.25, 1], []]

def boss_fight(n, h, d, b)
  w_d = Array.new(n) { nil }
  
  (0..(n-1)).each do |i|
    sec_exist = h[i].to_f / b
    t_damage = sec_exist * d[i]
    w_d[i] = [t_damage, sec_exist, d[i]] 
  end
  
  w_d.sort_by!{ |x| [-x[0], -x[2]] }
  
  first_w = w_d[0]
  sec_w = w_d[1]

  
  first_w[0] + sec_w[0] + [(first_w[1] * sec_w[2]), (sec_w[1] * first_w[2])].max
end
