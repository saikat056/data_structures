module Jump
  VALID = 1
  INVALID = 0
end

def can_jump(nums)
  hash = {}
  hash[(nums.size - 1)] = Jump::VALID
  (nums.size - 2).downto(0).each do |index|
    furthest = [(index + nums[index]), (nums.size - 1)].min
    hash[index] = Jump::INVALID
    furthest.downto(index + 1).each do |j|
      if hash[j] == Jump::VALID
        hash[index] = Jump::VALID
        break
      end
    end
  end
  hash[0] == Jump::VALID
end
