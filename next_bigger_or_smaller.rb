num = 1324
"10100101100"

"10100110001"

def next_big(num)
  n = num
  c = 0
  c1 = 0
  
  while((n>0) && (n%2 == 0)) do
    n = n >>1
    c += 1
  end
  
  while((n > 0) && (n%2) == 1) do
    n = n >> 1
    c += 1
    c1 += 1
  end
  
  num |= (1 << c)
  num &= ~((1 << c) - 1)
  mask = (1 << (c1-1)) - 1
  num | mask
end


"10100100011" == 1315

result = "10100011100" == 1308
mask = "1111011111"

mask = 000000111
c= 5
c1= 3

def next_small(num)
  n = num
  c = 0
  c1 = 0
  
  while ((n>0) && (n%2 == 1)) do
    n = n >> 1
    c += 1
    c1 += 1
  end
  
  while ((n > 0 ) && (n%2 == 0)) do
    n = n >> 1
    c += 1
  end
  
  c1 += 1
  
  mask = ~(1 << c)
  num &= mask
  num &= ~((1 << c) - 1)
  
  mask = (1 << c1) - 1
  mask = mask << 2
  num | mask
end
