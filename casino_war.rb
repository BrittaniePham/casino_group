require_relative 'cards'

class CasinoWar

  def initialize #bet
    draw_2_cards
  end

  def tie
  end

  def surrender
  end

  def go_to_war
  end

  def win
    
  end

  def welcome
    puts "===== Welcome to Casino War ====="
  end

  def draw_2_cards
    deck1 = Deck.new
    player_card = deck1.cards.shuffle.sample
    dealer_card = deck1.cards.shuffle.sample

    puts "You received a #{player_card.rank} of #{player_card.suit} (#{player_card.color})"
   puts "Dealer received a #{dealer_card.rank} of #{dealer_card.suit} (#{dealer_card.color})"
  end
end

start = CasinoWar.new