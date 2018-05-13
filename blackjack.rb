require_relative 'cards'

class BlackJack
  attr_accessor :blackjack_deck
  def initialize
    @blackjack_deck = Deck.new
    draw_card
  end

  def draw_card
    card_drawn = @blackjack_deck.cards.shuffle.shift
    rank = card_drawn.rank
    puts rank
  end


end

game = BlackJack.new