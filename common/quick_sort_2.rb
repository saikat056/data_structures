
def quick_sort(arr, p, r)
  return if p >= r

  q = partition(arr, p, r)
  quick_sort(arr, p, q-1)
  quick_sort(arr, q+1, r)
end


def partition(arr, p, r)
  ran = p + ((r - p + 1)*rand).floor
  arr[ran], arr[r] = [arr[r], arr[ran]]
  x = arr[r]
  i = p - 1

  (p..(r-1)).each do |j|
    if x >= arr[j]
      i += 1
      arr[i], arr[j] = [arr[j], arr[i]]
    end
  end

  arr[r], arr[i+1] = [arr[i+1], arr[r]]

  i+1
end

Time
----
  On an average case
      arr = [4, 5, 2, 3, 7]
        [4, 5]  2 [3,7]
  on an average the height of the recursion tree is O(log n)
  on each level, there will be O(n) operations
  T = O(n*log n)

Space
-----
  S = O(n), where n is the size of array
  - in-place
  - no additional space
  Total space = input space + no additional space


Test
----
        i
           j
  p        r
  0  1  2  3
  2, 3, 4, 5


Test
----
  i        j
  p        r
  0  1  2  3
  2, 3, 4, 5
           x


Test
----
         p           r
         0  1  2  3  4
  arr = [4, 5, 2, 3, 7]
  ran = ((r - p + 1)*rand).floor


