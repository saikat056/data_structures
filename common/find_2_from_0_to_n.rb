
# find number of 2's for all numbers from 0 to n

Time
====
  T = n*log_10(n)
  
Space
=====
  S = O(1)
  
def find_2_from_0_to_n(n)
  count = 0
  (0..n).each do |i|
    count += find_2_in_num(i)
  end
  count
end

def find_2_in_num(num)
  count = 0
  
  # T = log_10(num)
  while num != 0 do
    count += 1 if num%10 == 2
    num = num / 10
  end
  count
end

num = 242
num%10 = 2
num/10 = 24
num%10 = 4
num/10 = 2
num%10 = 2
num/10 = 0
