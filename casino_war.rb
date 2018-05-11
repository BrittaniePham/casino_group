require_relative 'cards'

class CasinoWar

  def initialize #bet
    welcome
    puts "*cards are shuffled*"
    draw_2_cards
  end

  def tie
    puts "IT'S A TIE! You both pulled the same value!"
    puts "enter 1 to go to war or enter 0 to surrender"
    choice = gets.to_i
    if choice == 1
      go_to_war
    elsif choice == 0 
      surrender
    else 
      puts "Not a valid option"
    end
  end

  def surrender
  end

  def go_to_war
  end

  def win
    puts "Your #{player_card} is greater than the dealer's #{dealer_card}"
    puts "Congrats! You won this round"
    #TODO WALLET + BET
    puts "You currently have ... " #TODO PRINT AMOUNT IN WALLET
  end

  def lose
  end

  def compare_cards
    if @player_card > @dealer_card
      win
    else 
      lose
    end
  end

  def welcome
    puts "===== Welcome to Casino War ====="
    puts
  end

  def draw_2_cards
    deck1 = Deck.new
    @player_card = deck1.cards.shuffle.sample
    @dealer_card = deck1.cards.shuffle.sample

    puts "You received a #{@player_card.rank} of #{@player_card.suit} (#{@player_card.color})"
   puts "Dealer received a #{@dealer_card.rank} of #{@dealer_card.suit} (#{@dealer_card.color})"
  end
end

start = CasinoWar.new