

merge_sort(arr, 0, arr.size - 1)
def merge_sort(arr, p, r)
  return if p >= r

  q = (p + r)/2
  merge_sort(arr, p, q)
  merge_sort(arr, q+1, r)
  merge(arr, p, q, r)
end

def merge(arr, p, q, r)
  return if p >= r

  t1 = []
  (p..q).each do |i|
    t1 << arr[i]
  end

  t2 = []
  ((q+1)..r).each do |i|
    t2 << arr[i]
  end

  i = j = 0
  k = p

  while((i < t1.size) && (j < t2.size)) do
    if t1[i] <= t2[j]
      arr[k] = t1[i]
      i += 1
    else
      arr[k] = t2[j]
      j += 1
    end
    k += 1
  end

  if i == t1.size
    while j < t2.size do
      arr[k] = t2[j]
      j += 1
      k += 1
    end
  else
    while i < t1.size do
      arr[k] = t1[i]
      i += 1
      k += 1
    end
  end
end

Time
----
L0         [4, 5, 10, 7, 8, 1]             O(n)
L1     [4, 5, 10]            [7, 8, 1]     O(n)
L2  [4,5]      [10]       [7,8]       [1]  O(n)

height of the tree, h = O(log n)
n = arr.size

T = O(n*log n)

Space
-----
  t1, t2 for array copy
  worst case space is required for the final merge
  S = O(n)

Test
----
  t1 = [6], t2 = [3]
  i = 0, j = 0
  arr = [3,6]

Test
----
  t1 = [4, 5]  t2 = [10]
  arr = [4,5,10]

Test
---      p     q         r
         0  1  2   3  4  5
  arr = [4, 5, 10, 7, 8, 1]
  arr.size = 6
  p = 0
  r = 5
  q = (0+5)/2 = 2





