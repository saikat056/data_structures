num  =  111011100111
s = ['1','1', '1',... ]
n = 12
left= []
right = []

       1 1 1 0 1 1 1 0 0 1 1 1
left=  1 2 3 0 1 2 3 0 0 1 2 3
right= 3 2 1 0 3 2 1 0 0 3 2 1

def flip_bit_to_win(num)
  s = num.to_s(2).chars
  n = s.size
  left = Array.new(n) { 0 }
  right = Array.new(n) { 0 }

  # O(b), b is the number of bits in the bit seq
  (0..(n-1)).each do |i|
    if s[i] == '1'
      if i == 0
        left[i] = 1
      else
        left[i] = left[i-1] + 1
      end
    end
  end

  # O(b)
  (0..(n-1)).reverse_each do |i|
    if s[i] == '1'
      if i == n-1
        right[i] = 1
      else
        right[i] = right[i+1] + 1
      end
    end
  end

  count = 0

  # O(b)
  (0..(n-1)).each do |i|
    count = [count, left[i]].max
    if s[i] == '0'
      temp = 1
      temp += left[i-1]  if i-1 >= 0
      temp += right[i+1] if i+1 < n
      count = [temp, count].max
    end
  end

  count
end

Time
----
  32 bits integer
  n = s.size = O(b)
  T = O(b)

Test
----
                             i
       1 1 1 0 1 1 1 0 0 1 1 1
left=  1 2 3 0 1 2 3 0 0 1 2 3
right= 3 2 1 0 3 2 1 0 0 3 2 1

count  = 7
temp = 1 + 3 + 3 = 7
