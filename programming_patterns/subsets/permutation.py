# Given a set of distinct numbers, find all of its permutations.

from collections import deque

def permutations(nums):
    n = len(nums)
    results = []
    p = deque()
    p.append([])

    for num in nums:
        len_p = len(p)
        for _ in range(len_p):
            old_p = p.popleft()

            for j in range(len(old_p) + 1):
                new_p = old_p.copy()
                new_p.insert(j, num)

                if len(new_p) == n: 
                    results.append(new_p)
                else: 
                    p.append(new_p)

    return results

print(permutations([3,2,1]))
