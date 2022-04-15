master's theorem
   
   T(n) = aT(n/b) + f(n)
   a>= 1, b > 1, f(n) = theta(n^k * (log(n))^p)
   
   case 1, log_b(a) > k, T(n) = theta(n^log_b(a))
   case 2, log_b(a) = k,
           p > -1, T(n) = theta(n^k * (log(n))^p+1)
           p = -1, T(n) = theta(n^k * log log(n))
           p < -1, T(n) = theta(n^k)
   case 3, log_b(a) < k, 
          p >= 0, T(n) = theta(n^k * (log(n))^p)
          p < 0,  T(n) = theta(n^k)
          
          
  1. T(n) = 3T(n/2) + n^2
     
     log_b(a) = log_2(3) ~ 1 + frac
     k = 2
     log_b(a) < k
     case 3
     T(n) = theta(n^2)
  
  2. T(n) = 4T(n/2) + n^2
   
     log_b(a) = log_2(4) = 2
     k = 2
     case 2,
     p = 0 > -1
     T(n) = theta(n^2 * log n)
     
  3. T(n) = T(n/2) + 2^n
     no case
     
  5. T(n) = 16 T(n/4) + n
     log_b(a) = log_4(16) = 2
     k = 1
     log_4(16) > k
     case 1
     T(n) = theta(n^2)
     
  6. T(n) = 2 *T(n/2) + n log n
     log_2(2) = 1
     k = 1
     log_2(2) = k
     p = 1 > -1
     case2
     T(n) = theta(n (log n)^2)
     
  7. T(n) = 2 * T(n/2) + n/ log n
     log_2(2) = 1
     p = -1
     log_2(2) = 1 = k
     case 2
      p = -1 
    T(n) = theta(n log log n)
    
  8. T(n) = 2 T(n/4) + n ^ 0.51
     log_4(2) = 0.50
     log_4(2) < k
     case 3
     T(n) = theta(n ^ 0.51)

   9. T(n) = 0.5 * T(n/2) + 1/n

 a is not >= 1, not applicable

10. T(n) = 16 T(n/4) + n!
a= 16
b = 4
log_b(a) = log_4(16) = 2
case 3
  T(n) = theta(n!)
  
11. T(n) = sqrt(2) T(n/2) + log n
  a = sqrt(2) 
  b = 2
  log_b(a) = log_2(sqrt(2)) = 1/2
  k = 0
  p = 1
  log_b(a) > k
  T(n) = theta(n^(1/2))
  
12. T(n) = 3 T(n/2) + n
  a = 3
  b = 2
  log_2(3) = x < 2
  k = 1
  p = 0
  log_2(3) > k
  O(n^(log_2(3)))
  
13. T(n) = 3 T(n/3) + sqrt(n)
  
  a = 3
  b = 3
  log_3(3) = 1
  k = 1/2
  p = 0
  case 1
    O(n)
    
14. T(n) = 4 T(n/2) + cn
    a = 4
    b = 2
    log_2(4) = 2
    k = 1
    p = 0
    log_2(4) > k
    case 1
      O(n^2)

15. T(n) = 3 T(n/4) + n log n
      a = 3
      b = 4
      log_4(3) = 0 < x < 1
      k = 1
      p = 1
      log_4(3) < k
      p >= 0
      T(n) = theta(n log n)
      
16. T(n) = 3 T(n/3) + n/2
      a = 3
      b = 3
      log_3(3) = 1
      k = 1
      p = 0
      log_3(3) = k
      case 2
        p > -1
        T(n) = theta(n log n)
        
17. T(n) = 6 T(n/3) + n^2 log n
      a = 6
      b = 3
      log_b(a) = log_3(6) = 1 < x < 2
      k = 2
      p = 1
      case 3
      T(n) = theta(n^2 log n)
        
18. T(n) = 4 T(n/2) + n / log n
      a = 4
      b = 2
      log_2(4) = 2
      k = 1
      p = -1
     case 1
      T(n) = theta(n^2)
       
19. T(n) = 
20. T(n) = 7 T(n/3) + n^2
      a = 7
      b = 3
      log_3(7) = 1 < x < 2
      k = 2
      p = 0
      case 3
        O(n^2)
21. T(n) = 4 T(n/2) + log n
      a = 4
      b = 2
      log_b(a) = log_2(4) = 2
      k = 0
      p = 1
      case 1
        O(n^2)  
