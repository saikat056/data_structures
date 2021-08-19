n = 4
arr = [5, 15, 1, 3]
output = [5, 10, 5, 4]

def find_median(arr)  
  min_heap = MinHeap.new
  max_heap = MaxHeap.new
  
  res = Array.new(arr.size) { 0 }
  
  # O(n), where n is the size fo arr
  # every heap operation will take O(log n) operations
  # T = O(n* log n)
  (0..(arr.size - 1)).each do |i|
    if min_heap.size == 0
      min_heap.add(arr[i])
    else
      if arr[i] > min_heap.top
        min_heap.add(arr[i])
      else
        max_heap.add(arr[i])
      end
      
      if(min_heap.size - max_heap.size).abs > 1
        if min_heap.size > max_heap.size
          max_heap.add(min_heap.pop)
        else
          min_heap.add(max_heap.pop)
        end
      end
    end
    
    if (min_heap.size == max_heap.size)
      res[i] = (min_heap.top + max_heap.top)/2
    else
      res[i] = (min_heap.size > max_heap.size) ? min_heap.top : max_heap.top
    end
  end
  
  res
end

Time
----
  T = O(n* log n)

Space
-----
  Additional space by min_heap and max_heap = O(n)


Test
----
       0   1  2  3 
arr = [5, 15, 1, 3]

i = 0, 1, 2,
min_heap       max_heap
  5               3
 15              1   

