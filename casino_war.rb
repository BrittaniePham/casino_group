require_relative 'cards'
require_relative 'wallet'

class CasinoWar
  attr_accessor :bet
  def initialize(bet)
    @bet = bet
    @wallet = 100
    welcome
    puts "*cards are shuffled*"
    draw_2_cards
  end

  def welcome
    puts "===== Welcome to Casino War ====="
    puts
  end

  def tie
    puts "IT'S A TIE! You both pulled the same value!\n"
    puts "--enter 1 to go to war and double the stakes"
    puts "--enter 0 to surrender and lose only half of what you bet"
    choice = gets.to_i
    if choice == 1
      go_to_war
    elsif choice == 0 
      surrender
    else 
      puts "Not a valid option, try again\n"
      tie
    end
  end

  def surrender #bet parameter
    @half = @bet / 2
    @wallet = @wallet - @half
    
    puts "You surrendered and lost $#{@half}. You now have $#{@wallet} left"
  end

  def go_to_war
    puts "\nYou've gone to war!!!"
    @double = @bet * 2
    draw_2_cards
  end

  def win_war
    puts "CONGRATS! YOU'VE WON THE WAR! YOU'VE WON DOUBLE $$"
    @wallet = @wallet + @double
    puts "You gained $#{@double}. You currently have $#{@wallet}"
  end


  def win
    puts "Your #{@player_card.rank} of #{@player_card.suit} is greater than the dealer's #{@dealer_card.rank} of #{@dealer_card.suit}"
    puts "Congrats! You won this round"
    #TODO WALLET + BET (call clatyons win method)
    puts "You currently have ... " #TODO PRINT AMOUNT IN WALLET
  end

  def lose
    puts "Your #{@player_card.rank} of #{@player_card.suit} is less than the dealer's #{@dealer_card.rank} of #{@dealer_card.suit}"
    puts "Sorry! You lost this round"
    #TODO WALLET - BET (call clatyons lose method)
    puts "You currently have ... " #TODO PRINT AMOUNT IN WALLET
  end

  def compare_cards

    value_player_card
    value_dealer_card

    if (@player_card.rank.to_i > @dealer_card.rank.to_i)
      win
    elsif (@player_card.rank.to_i < @dealer_card.rank.to_i)
      lose
    elsif (@player_card.rank.to_i == @dealer_card.rank.to_i)
      value_tie
      tie
    end
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

  def value_tie
    if @player_card.rank == 'A' && @dealer_card.rank == 'A'
      @player_card.rank = 1 
      @dealer_card.rank = 1 
    elsif @player_card.rank == 'J' && @dealer_card.rank == 'J'
      @player_card.rank = 11 
      @dealer_card.rank = 11
    elsif @player_card.rank == 'Q' &&  @dealer_card.rank == 'Q'
      @player_card.rank = 12
      @dealer_card.rank = 12
    elsif @player_card.rank == 'K' && @dealer_card.rank == 'K'
      @player_card.rank = 13
      @dealer_card.rank = 13
    end
  end

  def value_player_card
    case @player_card.rank 
    when 'A'
      @player_card.rank = 1 
    when 'J'
      @player_card.rank = 11 
    when 'Q'
      @player_card.rank = 12
    when 'K'
      @player_card.rank = 13
    end
  end

  def value_dealer_card
    case @dealer_card.rank 
    when 'A'
      @dealer_card.rank = 1 
    when 'J'
      @dealer_card.rank = 11 
    when 'Q'
      @dealer_card.rank = 12
    when 'K'
      @dealer_card.rank = 13
    end
  end

end

#@person_wallet.show_wallet
start = CasinoWar.new