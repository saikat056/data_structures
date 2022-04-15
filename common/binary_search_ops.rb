
arr = [1,4,7,9,10,14,20]

target = 12
target = 14


def ceil(arr, target)
  low = 0
  high = arr.size - 1
  
  while low < high do
    mid = (low + high) / 2
    
    if target == arr[mid]
      return mid
    elsif target > arr[mid]
      low = mid + 1
    else
      high = mid
    end
  end
  
  [low, arr[low]]
end

def upper_key(arr, target)
  low = 0
  high = arr.size - 1
  
  while low < high do
    mid = (low + high) / 2
    
    if target >= arr[mid]
      low = mid + 1
    else
      high = mid
    end
  end
  
  [low, arr[low]]
end


def floor(arr, target)
  low = 0
  high = arr.size - 1
  
  while low < high do
    mid = (low + high) / 2

    if target == arr[mid]
      return mid   
    elsif target > arr[mid]
      low = mid + 1
    else
      high = mid
    end
  end
  
  low -= 1
  
  [low, arr[low]]
end

def lower_key(arr, target)
  low = 0
  high = arr.size - 1
  
  while low < high do
    mid = (low + high) / 2
    
    if target == arr[mid]
      low = mid
      break
    elsif target > arr[mid]
      low = mid + 1
    else
      high = mid
    end
  end
  
  low -= 1
  
  [low, arr[low]]
end




