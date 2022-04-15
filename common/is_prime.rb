test
30 = 3*10
   = 2*15

2,3,4,5


def is_prime?(n)
  x = 2
  
  while(x*x < n) do
    return false if (n%x == 0)
    x += 1
  end
  
  return true
end

Time
2..sqrt(n)
O(sqrt(n))

Space
O(1)
