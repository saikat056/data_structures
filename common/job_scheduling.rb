# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer[]} profit
# @return {Integer}
def job_scheduling(start_time, end_time, profit)
  arr = []
  n = start_time.size
    
  (0..(n-1)).each do |i|
    arr << [start_time[i], end_time[i], profit[i]]
  end
  
  arr.sort_by!{|x| x[1]}
  p = Array.new(n) { 0 }
  p[0] = arr[0][2]

  # T = O(n*log(n))  
  (1..(n-1)).each do |i|
    j = bs(arr, i)
    p[i] = arr[i][2]
    p[i] += p[j] if j != -1
    
    p[i] = [p[i], p[i-1]].max
  end
  
  p[-1]
end

def bs(arr, i)
  s1 = arr[i][0]
  start = 0
  stop = i - 1
  
  return -1 if s1 < arr[start][1]
  return stop if s1 >= arr[stop][1]
  
  while start < stop do
    mid = (start + stop)/2
    
    if s1 < arr[mid][1]
      stop = mid - 1
    else
      start = mid + 1
    end
  end
  
  s1 < arr[start][1] ? (start - 1) : start
end
