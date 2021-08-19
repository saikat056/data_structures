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
  while start <= stop
    mid = (start + stop) / 2

    if (mid * mid) == num
      ans = mid
      break
    end

    if mid * mid < num
      start = mid + 1
      ans = mid
    else
      stop = mid - 1
    end
  end

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


