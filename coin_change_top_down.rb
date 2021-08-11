def coin_change(coins, amount)
  return -1 if coins.size == 0
  coin_hash = {}
  coins = coins.sort
  make_coin_change(coins, amount, coin_hash)
end


def make_coin_change(coins, amount, coin_hash)
  return -1 if amount < 0
  return 0 if amount == 0

  min_change = nil
  coins.each do |coin|
    break if coin > amount
    change = (coin_hash[amount - coin] || make_coin_change(coins, amount - coin, coin_hash)) + 1
    if change > 0
      if min_change == nil
        min_change = change 
      elsif change < min_change
        min_change = change
      end
    end
  end
  coin_hash[amount] = min_change == nil ? -1 : min_change
  coin_hash[amount]
end

puts coin_change([1,5,10], 20)
