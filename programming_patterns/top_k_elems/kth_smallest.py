from heapq import *

def kth_smallest(arr, k):
    maxheap = []

    for i in range(k):
        heappush(maxheap, -arr[i])

    for i in range(k, len(arr)):
        if -arr[i] > maxheap[0]:
            heappop(maxheap)
            heappush(maxheap, -arr[i])

    return -maxheap[0]


print(kth_smallest([1,5,12,2,11,5],3))
print(kth_smallest([1,5,12,2,11,5],4))
print(kth_smallest([5,12,11,-1,12],3))
