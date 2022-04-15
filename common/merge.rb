partially_sorted_array= [4,100,100,100,4,89,99,9,9,9,45,5,5,89,34,3]

def merge_sort(array, p, r)
  return if p == r
  pivot = p + ((r - p)/ 2)
  merge_sort(array, p, pivot)
  merge_sort(array, pivot+1, r)
  merge(array, p, pivot, r)
end

def merge(array, p,q,r)
  arr_a_length = q - p + 1
  arr_b_length = r - q
  arr_a = []
  arr_b = []
  for i in 0..arr_a_length-1 do
    arr_a.push(array[p+i])
  end

  arr_b = Array.new(arr_b_length)
  for i in 0..arr_b_length-1 do 
    arr_b[i] = array[q+1+i]
  end

  i,j = 0,0
  k = p
  while i < arr_a_length && j < arr_b_length do
    if arr_a[i] <= arr_b[j]
      array[k] = arr_a[i]
      i += 1
    else
      array[k] = arr_b[j]
      j += 1
    end
    k += 1
  end
  
  if i == arr_a_length
    while j < arr_b_length do
      array[k] = arr_b[j]
      k += 1
      j += 1
    end
  else
    while i < arr_a_length do
      array[k] = arr_a[i]
      k += 1
      i += 1
    end
  end
end

merge_sort(partially_sorted_array, 0, (partially_sorted_array.length - 1)) 
puts partially_sorted_array
