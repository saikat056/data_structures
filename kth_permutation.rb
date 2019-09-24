# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
  @arr = []
  n.times{|elem| @arr << (elem + 1).to_s}
  @hash = Hash.new(false)
  @rank = 0
  @num_size = n
  @target_rank = k
  @kth_per = nil
  @str_arr = Array.new(n)
  get_per(0)
end

def get_per(len)
  if len == @num_size
    @rank += 1
    @kth_per = @str_arr.join if @rank == @target_rank
    return
  end
  @arr.each do |elem|
    next if @hash[elem]
    @hash[elem] = true
    @str_arr[len] = elem
    get_per(len + 1)
    @hash[elem] = false
    return @kth_per if @kth_per
  end
end
