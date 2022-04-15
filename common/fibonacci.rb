fibonacci number

0,1,2,3,4,5, 6, 7
1,1,2,3,5,8,13,21

f(n) = f(n-1) + f(n-2)

def fibo(n)
  return 1 if n <= 1
  
  fibo(n-1) + fibo(n-2)
end

            f(4)
       f(3)       f(2)
    f(2)  f(1)  f(1) f(0)
  f(1) f(0)


T(n) =  1+2+2^2+...+2^n
     = O(2^n)


# memoization
n = 7
memo = Array.new(n + 1)
def fibo(n, memo)
  return 1 if n <= 1
  return memo[n] unless memo[n].nil?
  
  memo[n] = fibo(n-1, memo) + fibo(n-2, memo)
  memo[n]
end


def fibo(n)
  return 1 if n <= 1
  
  memo = Array.new(n+1)
  memo[0] = 1
  memo[1] = 1
  
  (2..n).each { |i| memo[i] = memo[i-1] + memo[i-2] }
  memo[n]
end

test
----
  n = 0,1
  n = 2  f[2] = f[1] + f[0]
