
# Majority Element. A majority element is an element that makes up more than half of the items in an array.

arr = [1,1,7,2,3,1,1,1]
res = 1

arr = [1,2,3,4]
res = -1

                            v
arr = [1, 1, 7, 2, 3, 1, 1, 1]
count = 2
m = 1
arr.size / 2 = 8/ 2 = 4
res = 1

def majority(arr)
  return -1 if arr.size < 1
  
  m = find_majority(arr)
  valid?(arr, m) ? m : -1
end

def find_majority(arr)
  # S = O(1)
  count = 1
  m = arr[0]
  
  # T = O(n)
  (1..(arr.size - 1)).each do |i|
    if count == 0
      m = arr[i]
    end
    
    if m == arr[i]
      count += 1
    else
      count -= 1
    end
  end
  
  m
end

def valid?(arr, m)
  count = 0
  # T = O(n)
  arr.each do |e|
    if m == e
      count += 1
    end
  end
  
  count > (arr.size / 2)
end

Time
----
  T = O(n)
  
Space
-----
  S = O(1) additional space
