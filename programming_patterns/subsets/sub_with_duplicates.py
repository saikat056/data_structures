def subsets(nums):
    nums.sort()

    subs = []
    subs.append([])
    start, end = 0,0

    for i in range(len(nums)):
        start = 0
        if i > 0 and nums[i-1] == nums[i]:
            start = end + 1
        end = len(subs) - 1

        for j in range(start, end + 1):
            s = subs[j].copy()
            s.append(nums[i])
            subs.append(s)

    return subs

print(subsets([2,1,2]))

# Time complexity: If there is no duplicates, total number of subsets doubles in each step. So, we will have a total number of O(2^N) subsets in the final output, where N is the number of elements in the list(nums). Since we construct a new subset from an existing set, therefore, the time complexity of the above algorithm is O(N*2^N)

# Space complexity: All the additional space required by the algorithm is for the output list. The output list contains O(2^N) subsets and each subset contains O(N) elements. So, the total space complexity for the above algorithm is O(N*2^N)
