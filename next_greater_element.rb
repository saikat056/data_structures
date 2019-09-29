# leetcode 496
# solution 1
# Time complexity: O(m*n)
def next_greater_element(nums1, nums2)
  hash = {}
  arr = []
  nums2.each_with_index{|elem, index| hash[elem] = index}
  nums1.each do |elem|
    i = hash[elem]
    while i < nums2.size
      if elem < nums2[i]
        arr << nums2[i]
        break
      end
      i += 1
    end
    arr << -1 if i == nums2.size
  end
  arr
end
