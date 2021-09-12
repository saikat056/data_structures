# @param {Integer[]} arr
# @return {Integer}
def min_jumps(arr)
  n = arr.size
  h = {}

  (0..(n-1)).each do |i|
    h[arr[i]] ||= []
    h[arr[i]] << i
  end

  min_arr = Array.new(n) { Float::INFINITY }

  min_arr[0] = 0

  (0..(n-1)).each do |i|
    min_arr[i+1] = [min_arr[i+1], min_arr[i] + 1].min if i+1 <  n
    min_arr[i-1] = [min_arr[i-1], min_arr[i] + 1].min if i-1 >= 0
    
    h[arr[i]].each do |j|
      if i != j
        min_arr[j] = [min_arr[j], min_arr[i] + 1].min
      end
    end
  end
  
  (0..(n-1)).each do |i|
    h[arr[i]].each do |j|
      if i != j
        min_arr[j] = [min_arr[j], min_arr[i] + 1].min
      end
    end
  end

  min_arr[-1]
end
