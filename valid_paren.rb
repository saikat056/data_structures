def generate_parenthesis(n)
  @hash = {}
  gen_paren(n)
end

def gen_paren(n)
  return [""]  if n == 0
  result = []
  n.times do |i|
    left = @hash[i] ||= gen_paren(i)
    left.each do |l|
      right = @hash[n - 1 - i] ||= gen_paren(n - 1 - i)
      right.each {|r| result << "(" + l + ")" + r}
    end
  end
  result
end
