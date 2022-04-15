# write a method to shuffle the deck of cards randomly

        52 51 50
              v
deck = [50, 30, 2,..,0,51]
 0 <= r < 52 
 0 <= r < 51

 hash = {0: 'H1', 1: 'H2', 2: '', .....}
def shuffle(deck)
   count  = deck.size
   # T = O(n) = O(1), n == 52
   (0..(deck.size - 1)).each do |i|
      r = (rand*count).floor
      deck[i], deck[i+r] = [deck[i+r], deck[i]]
      count -= 1
   end
   
   deck
end

Time
----
 T = O(n), n is the size of deck
   = O(1) because n == 52 always
 S = O(1), n is the size of deck = 52
