class Card
  def initialize(suit:, value:)
    @suit = suit
    @value = value
  end
end

class Suit
  HEART = 0
  CLUB = 1
  SPADE = 2
  DIAMOND = 3
  
  def self.suits
    [Suit::HEART, Suit::CLUB, Suit::SPADE, Suit::DIAMOND]
  end
end

class Deck
  def initialize
    @arr_of_cards = create_cards()
    @card_hash ={}
  end

  def create_cards()
    arr = []
    Suit.suits.each do |suit|
      (1..13).each do |value|
        arr.push(Card.new(suit: suit, value: value))
      end
    end
    arr
  end

  #generates random integer between 1 to 52
  def random_card_index
  end

  def draw_card()
    card_index = -1
    while
      card_index = random_card_index
      break if @card_hash[card_index].nil?
    end
    @card_hash[card_index] = true
    @arr_of_cards[card_index]
  end
end

class Player
  def initialize
    @arr_of_cards = []
  end

  def get_card(card:)
    return false if @arr_of_cards.size == 2
    @arr_of_cards.push(card)
    return true
  end
end

class Dealer
  def initliaze(deck, board, players)
    @deck = deck
    @board = board
    @players = players
  end

  def disrtibute_cards
    @players.each do |player|
      player.get_card(@deck.draw_card())
      player.get_card(@deck.draw_card())
      @board.get_flop_cards([@deck.draw_card, @deck.draw_card, @deck.draw_card ])
      @board.get_turn_card(@deck.draw_card)
      @board.get_river_card(@deck.draw_card)
    end
  end
end

class Board
  def initialize
    @arr_of_cards = []
    @flop_cards = []
  end

  def get_flop_cards(cards)
    @flop_cards = cards
  end

  def get_turn_card(card)
    @turn_card = card
  end

  def get_river_card(card)
    @river_card = card
  end

  def flip_flop_cards
  end

  def flip_turn_card
  end

  def flip_river_card
  end
end

class Game
  def initialize(num_of_players)
    @num_of_players = num_of_players
  end

  def play
    deck = Deck.new
    board = Board.new
    players = []
    num_of_players.times {|index| players.push(Player.new) }
    dealer = Dealer.new(deck, board, players)
    dealer.disrtibute_cards
  end
end

