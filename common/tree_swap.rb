#!/bin/ruby

#
# Complete the swapNodes function below.
#
def swapNodes(indexes, queries)
    #
    # Write your code here.
    #
    return [] if indexes.count == 0
    inorderArr = []
    queries.each do |k|
      runQueryAtLevel(indexes, k)
      inorderArr.push(inorderTraversal(indexes))
    end
    return inorderArr
end

def runQueryAtLevel(indexes, k)
  queue = []
  level = 1
  queue.push(1)
  queue.push(0)

  while(queue.count != 1)
    element = queue.shift
    if element == 0
      level += 1
      queue.push(0)
      next
    end

    if (level % k) == 0
      indexes[element - 1][0], indexes[element - 1][1] = indexes[element - 1][1], indexes[element - 1][0]
    end
    queue.push(indexes[element - 1][0]) if indexes[element - 1][0] != -1
    queue.push(indexes[element - 1][1]) if indexes[element - 1][1] != -1
  end
end

def inorderTraversal(indexes)
  arr = []
  recursiveInorderTraversal(indexes, 1, arr)
  arr
end

def recursiveInorderTraversal(indexes, current_index, arr)
  return arr.push(current_index) if indexes[current_index-1][0] == -1 && indexes[current_index-1][1] == -1
  recursiveInorderTraversal(indexes, indexes[current_index-1][0], arr) if indexes[current_index-1][0] != -1
  arr.push(current_index)
  recursiveInorderTraversal(indexes, indexes[current_index-1][1],arr) if indexes[current_index-1][1] != -1
end



fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

indexes = Array.new(n)

n.times do |indexes_row_itr|
    indexes[indexes_row_itr] = gets.rstrip.split(' ').map(&:to_i)
end

queries_count = gets.to_i

queries = Array.new(queries_count)

queries_count.times do |queries_itr|
    queries_item = gets.to_i
    queries[queries_itr] = queries_item
end

result = swapNodes indexes, queries

fptr.write result.map{ |x| x.join " " }.join "\n"
fptr.write "\n"

fptr.close()
