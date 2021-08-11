
Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]

def accounts_merge(accounts)
  accounts_hash = {}
  
  accounts.each do |account|
    name = check(accounts_hash, account)

    (1..(account.size - 1)).each do |index|
       accounts_hash[account[index]] = name
    end
  end
end

def check(accounts_hash, account)
  (1..(account.size - 1)).each do |index|
   return account[0] if accounts_hash[account[index]]
  end

  nil
end


