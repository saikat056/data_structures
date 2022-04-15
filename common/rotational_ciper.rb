input = "Zebra-493?"
rotationFactor = 3
output = "Cheud-726?"

def rotational_cipher(input, rotation_factor)
  # S = O(1)
  capital = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  small = "abcdefghijklmnopqrstuvwxyz"
  number = "0123456789"
  
  res = ""
  
  # O(n), n is number of chars in input
  input.chars.each do |c|
    if (c >= 'A' && c <= 'Z')
      # O(1)
      index = ((c.ord - 'A'.ord) + rotation_factor) % 26
      res += capital[index]
    elsif (c >= 'a' && c <= 'z')
      # O(1)
      index = ((c.ord - 'a'.ord) + rotation_factor) % 26
      res += small[index]
    elsif (c >= '0' && c <= '9')
      # O(1)
      index = ((c.ord - '0'.ord) + rotation_factor) % 10
      res += number[index]
    else
      # O(1)
      res += c
    end
  end
  
  # S = O(n)
  res
end

Time
-----
  T = O(n)

Space
-----
  to store result, we need O(n) space
  S - O(n)

Test
-----
          0 1 2 3 4 5 6 7 8 9
  input = Z e b r a - 4 9 3 ?
          C h       - 7
