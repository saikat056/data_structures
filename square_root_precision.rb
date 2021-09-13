Test
----
  num = 9
  start = 2,3
  stop = 3
  mid = 4,1,2,3
  ans = 2

def sqaure_root(num, precision)
  # S = O(1)
  start = 0
  stop = num

  ans = 0

  # O(log(num))  
  while start < stop do
    mid = (start + stop)/2
      
    if num > mid*mid
      start = mid + 1
    else
      stop = mid
    end
  end
  
  ans = (start*start == num) ? start : (start - 1)

  # O(1)
  p = 0.1
  precision.times do |t|
    while (ans * ans) <= num do
      # max 10 digits trial
      ans += p
    end
    ans -= p
    p = p/10
  end

  ans
end

Time
-----
  T = calculate integral + calculate fraction
    = O(log(num)) + O(1) = O(log(num))

Space
-----
  S= O(1)

Test
----
  num = 10
  s = sqrt(10)
  integral part of s = 3
  precision = 3
  fractional part of s = 3.145
                           ^^^

Test
----
  num = 10
  start = 0,3,4
  stop = 10,4
  mid = 5,2,3
  ans = 0,2,3


