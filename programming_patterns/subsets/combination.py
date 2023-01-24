# (Backtracking/DFS) Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order. The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        results = []

        def bt(remain, comb, start):
            if remain == 0:
                results.append(list(comb))
                return
            elif remain < 0:
                return

            for i in range(start, len(candidates)):
                comb.append(candidates[i])
                bt(remain - candidates[i], comb, i)
                comb.pop()

        bt(target, [], 0)

        return results

# Time Complexity: O(N^p), p = T/M + 1, where N be the number of candidates, T be the target value, and M be the minimal value among the candidates.
# Space Complexity: O(p), p = T/M
