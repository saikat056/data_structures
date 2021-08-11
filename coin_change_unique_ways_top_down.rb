def coin_change(amount, coins)
  count = coin_change_for(amount, coins)
  return count == 0 ? -1 : count
end

def coin_change_for(amount, coins)
  count = 0

  coins.each_with_index do |coin, index|
    remain = amount - coin
    if remain == 0
      count += 1
    elsif remain > 0
      count += coin_change_for(remain, coins[index..(coins.length - 1)])
    end
  end

  count
end


coins = [1, 2, 5]
puts coin_change(11, coins)
