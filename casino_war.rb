require_relative 'cards'

class CasinoWar

  def initialize #bet
    @wallet = 100
    @bet = 10
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
      puts "Not a valid option, try again"
      tie
    end
  end

  def surrender() #bet parameter
    # @half = @bet / 2
    # total = @wallet - @half
  end

  def go_to_war
  end

  def win
    puts "Your #{@player_card.rank} of #{@player_card.suit} is greater than the dealer's #{@dealer_card.rank} of #{@dealer_card.suit}"
    puts "Congrats! You won this round"
    #TODO WALLET + BET
    puts "You currently have ... " #TODO PRINT AMOUNT IN WALLET
  end

  def lose
    puts "Your #{@player_card.rank} of #{@player_card.suit} is less than the dealer's #{@dealer_card.rank} of #{@dealer_card.suit}"
    puts "Sorry! You lost this round"
    #TODO WALLET - BET
    puts "You currently have ... " #TODO PRINT AMOUNT IN WALLET
  end

  def compare_cards
    value 

    if (@player_card.rank.to_i > @dealer_card.rank.to_i)
      win
    elsif (@player_card.rank.to_i < @dealer_card.rank.to_i)
      lose
    elsif (@player_card.rank.to_i == @dealer_card.rank.to_i)
      tie
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
    puts
    compare_cards
  end

  def value
    case 
    when @player_card.rank == 'A'
      @player_card.rank = 1 
    when @dealer_card.rank == 'A'
      @dealer_card.rank = 1 
    when @player_card.rank == 'J'
      @player_card.rank = 11 
    when @dealer_card.rank == 'J'
      @dealer_card.rank = 11
    when @player_card.rank == 'Q'
      @player_card.rank = 12
    when @dealer_card.rank == 'Q'
      @dealer_card.rank = 12
    when @player_card.rank == 'K'
      @player_card.rank = 13
    when @dealer_card.rank == 'K'
      @dealer_card.rank = 13
    end
  end

end

start = CasinoWar.new