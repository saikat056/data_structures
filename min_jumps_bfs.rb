https://leetcode.com/problems/jump-game-iv/


Given an array of integers arr, you are initially positioned at the first index of the array.

In one step you can jump from index i to index:

i + 1 where: i + 1 < arr.length.
i - 1 where: i - 1 >= 0.
j where: arr[i] == arr[j] and i != j.

Input: arr = [100,-23,-23,404,100,23,23,23,3,404]
Output: 3
Explanation: You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.
  
# @param {Integer[]} arr
# @return {Integer}
def min_jumps(arr)
  n = arr.size
  
  hash = {}
  (0..(n-1)).each do |i|
    hash[arr[i]] ||= []
    hash[arr[i]] << i
  end

  q = []
  visited = {}

  q << [0, 0]

  while !q.empty? do
    index, d = q.shift
    
    visited[index] = true
    
    return d if index == n-1
    
    q << [index + 1, d + 1] if (index + 1 <  n) && !visited[index+1]
    q << [index - 1, d + 1] if (index - 1 >= 0) && !visited[index-1]
    
    hash[arr[index]].each do |k|
      if index != k
        q << [k, d + 1] if !visited[k]
      end
    end
    
  end

  -1
end
