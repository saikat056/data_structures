from heapq import *

def find_k_largest(arr, k):
   minheap = []

   for i in range(k):
       heappush(minheap, arr[i])

   for i in range(k, len(arr)):
       if arr[i] > minheap[0]:
           heappop(minheap)
           heappush(minheap, arr[i])

   return minheap
   

print(find_k_largest([3,1,5,12,2,11], 3))
print(find_k_largest([5,12,11,-1,12], 3))
