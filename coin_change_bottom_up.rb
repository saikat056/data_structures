def coin_change(coins, amount)
  return 0 if amount == 0
  return -1 if amount < 0
  arr = Array.new(amount + 1)  
  arr[0] = 0
  coins = coins.sort
  (1..amount).each do |num|
    min_change = nil
    coins.each do |coin|
      break if coin > num
      if arr[num - coin] >= 0
        change = arr[num - coin] + 1
        min_change = change if min_change == nil || min_change > change
      end
    end
    arr[num] = (min_change == nil) ? -1 : min_change
  end
  arr[amount]
end
