# Given a set with distinct elements, find all of its distinct subsets

# nums = [2,3,4]
def subsets(nums):
   subs = []
   subs.append([])
   
   for elem in nums:
       n = len(subs)
       for i in range(n):
           s = subs[i].copy()
           s.append(elem)
           subs.append(s)
           
   return subs

# Time complexity: Since, in each step, the number of subsets doubles, there is a total of O(2^N) subsets where N is the number of elements in the array(nums). And,since we construct a new subset from an existing subset, the time complexity of above algorithm would be O(N*2^N)

# Space complexity: All additional space used by the algorithm is for the output list. The output list contains O(2^N) subsets and each subset contains O(N) elements. So, the total space complexity is O(N*2^N)
