# binary min heap

                        8
                       /  \
                      2    5
                     / \
                    7   6

         0, 1, 2, 3, 4, 5 
arr = [nil, 8, 2, 5, 7, 6]

arr = [nil, 2, 6, 5, 7, 8]

arr[parent(i)] <= arr[i]

def parent(i)
  i/2
end

def left(i)
  2*i
end

def right(i)
  2*i + 1
end

# O(log(n))
def min_heapify(arr, i)
  lowest = i
  lowest = (arr[i] <= arr[left(i)]) ? i : left(i) if left(i) < arr.size
  lowest = (arr[lowest] <= arr[right(i)]) ? lowest : right(i) if right(i) < arr.size
  
  if(lowest != i)
    arr[lowest], arr[i] = [arr[i], arr[lowest]]
    min_heapify(arr, lowest)
  end
end

def build_min_heap(arr)
  last = arr.size - 1
  p = parent(last)
  
  # O(n*log(n)) but tighter bound is O(n)
  (1..p).reverse_each do |index|
    min_heapify(arr, index)
  end
end

def heap_sort(arr)
  return [] if arr.size <= 1
  
  # O(n)
  build_min_heap(arr)
  
  result = []
  
  # O(n*log(n))
  while arr.size > 1
    last = arr.size - 1
    arr[1], arr[last] = [arr[last], arr[1]]
    result << arr.pop
    min_heapify(arr, 1)
  end
  
  result
end


Time Complexity
                         8
                       /  \
                      2    5
                     / \
                    7   6

nearly complete tree. Worst case is when bottom-level is half-empty

  T(n) = T(2n/3) + O(1)
  b = 3/2
  a = 1
  T(n) = T(n/b) + O(1)
       = T(n/(b^2)) + 2
       = T(n/(b^3)) + 3
       = T(1) + k = O(1) + log_b(n) = O(log_b(n)), where b = 3/2 > 1
  
    n/(b^k) = 1
 => n = b^k
 => log_b(n) = k * log_b(b)
 => k = log_b(n)
  
# min_heapify(arr, i)
 T(n) = log(n)
  
# heap_sort(arr)
 T(n) = O(n*log(n))


Test
arr = [nil, 8, 2, 5, 7, 6]

arr = [nil, 2, 6, 5, 7, 8]

arr = [nil, 6, 7, 8]
result = [2, 5]

Test
arr = [nil]
arr = []
