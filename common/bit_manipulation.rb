def get_bit(num, i)
  return 1 if num & (1 << i) != 0
  0
end

def set_bit(num, i)
  num | (1 << i)
end

def clear_bit(num, i)
  num & ~(1 << i)
end


 1 0 1 0 1 0 1 0 0 1
 ^           ^
MSB        i = 3

1 << i
1 << 3 == 1 0 0 0
m = (1 << 3) - 1 == 0 1 1 1

         1 0 1 0 1 0 1 0 0 1
m   &    0 0 0 0 0 0 0 1 1 1
-----------------------------
         0 0 0 0 0 0 0 0 0 1

def clear_bits_MSB_thr_i(num, i)
  mask = (1 << i) - 1
  num & mask
end

-1 = 111111111
  1 0 1 0 1 0 1 0 0 1
  1 1 1 1 1 1 0 0 0 0
----------------------
  1 0 1 0 1 0 0 0 0 0
              ^
             i = 3

def clear_bits_i_thr_0(num, i)
  mask = (-1 << (i + 1))
  num & mask
end
