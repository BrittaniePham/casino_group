require_relative 'cards'

class CasinoWar
  attr_accessor :bet
  def initialize(bet)
    @bet = bet
    @player_money = 0 # player has not won or lost anything
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

  def surrender
    @bet = @bet / 2
    @player_money = @player_money - @bet
    puts "You surrendered and lost $#{@bet}."
  end

  def go_to_war
    puts "\nYOU'VE GONE TO WAR!!!"
    @bet = @bet * 2
    draw_2_cards
  end

  def win_war
    puts "CONGRATS! YOU'VE WON THE WAR! YOU'VE WON DOUBLE $$"
    @player_money = @player_money + @double
    puts "You gained $#{@double}!"
  end

  def win
    puts "Your #{@player_card.rank} of #{@player_card.suit} is greater than the dealer's #{@dealer_card.rank} of #{@dealer_card.suit}"
    puts "Congrats! You won this round"
    @player_money = @player_money + @bet
    puts "You gained $#{@bet}!"
  end

  def lose
    puts "Your #{@player_card.rank} of #{@player_card.suit} is less than the dealer's #{@dealer_card.rank} of #{@dealer_card.suit}"
    puts "Sorry! Unfortunately, you didn't win this round"
    @player_money = @player_money - @bet
    puts "You lost $#{@bet} ..."
  end

  def return_amount
    @player_money
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

#run ruby person.rb to test when this is gone!


#CasinoWar.new(10) #erase when y'all test yours. this is just here for Britt to test

