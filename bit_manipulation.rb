def print_bitmap(value)
  31.downto(0).map {|x| value[x]}.join
end

def paste_bits(first_num, second_num, start, finish)
  mask = create_mask(start, finish)
  (first_num & mask)|(second_num & ~mask)
end

def create_mask(start, finish)
  return 0 if start > finish
  bit_count = finish - start + 1
  mask = 0
  bit_count.times { mask = (mask << 1) + 1 }
  mask << start
end

def print_fraction(value)
  arr = ['.']
  while value > 0
    break if arr.count > 32
    value *= 2
    if value >= 1
      arr.push('1')
      value -= 1
    else
      arr.push('0')
    end
  end
  arr.join
end
