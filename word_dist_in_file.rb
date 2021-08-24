
# Word distance. You have a large file containing words. Given any two words, find the shortest distance
# cci 17.11

arr = ['an', 'I', 'am' 'hello', 'a', 'be', 'an' ]
w1 = 'an'
w2 = 'be'

arr1 = [0, 6]
arr2 = [5]

res  = 1

def word_dist(arr, w1, w2)
  hash = {}

  # T = O(n)
  (0..(arr.size - 1)).each do |i|
    w = arr[i]
    if (w == w1) || (w == w2)
      hash[w] ||= []
      hash[w] << i
    end
  end

  # T = O(p + q),
  # p = size of array containing all indexes of w1
  # q = size of array containing all indexes of w2
  d = Float::INFINITY
  d = shortest_dist(hash[w1], hash[w2]) if hash[w1] && hash[w2]

  (d == Float::INFINITY) ? -1 : d
end

def shortest_dist(arr1, arr2)
  i = j = 0

  min_dist = Float::INFINITY

  while (i < arr1.size) && (j < arr2.size) do
    if arr1[i] < arr2[j]
      d = (arr1[i] - arr2[j]).abs - 1
      min_dist = [d, min_dist].min
      i += 1
    else
      d = (arr1[i] - arr2[j]).abs - 1
      min_dist = [d, min_dist].min
      j += 1
    end
  end

  min_dist
end

Time
-----
  T = O(n)

Space
-----
  T = O(n), worst-case n = p + q
    = O(p+q), avg n > p + q
  p = size of array containing all indexes of w1
  q = size of array containing all indexes of w2

arr1 = [0, 6]
arr2 = [5]
i = 2, j = 0
min_dist = 1

