# Given an array of numbers sorted in an ascending order, find the ceiling of a given number key. The ceiling of the key will be the smallest element in the given array greater than or equal to the key.

def floor(nums, key):
    if key > nums[-1]: return -1

    n = len(nums)
    start, end = 0, n-1

    while(start <= end):
        mid = (start + end)//2

        if key < nums[mid]:
            end = mid - 1
        elif key > nums[mid]:
            start = mid + 1
        else:
            return mid

    return start

# Time complexity: O(log(N))
# Space complexity: O(1)

print(ceiling([4, 6, 10], 6))
print(ceiling([1, 3, 8, 10, 15], 12))
print(ceiling([4, 6, 10], 17))
