require_relative 'cards'

class BlackJack
  attr_accessor :blackjack_deck,:cards_drawn, :dealer_score, :dealer_cards_drawn, :bet


  def initialize(bet)
    @bet = bet
    @dealer_cards_drawn = 0
    @cards_drawn = 0
    @dealer_score = 0
    @blackjack_deck = Deck.new
    draw_card_player
  end

  def draw_card_player(score = 0)
    @score = score
    card_drawn = @blackjack_deck.cards.shuffle.shift
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "You have drawn  #{card_drawn.rank}"
    rank = card_drawn.rank
    case rank
    when 'A'
      puts "Would you like this ace to count as 1 or 11?"
      @card_value = give_value_to_ace
    when 'J', 'Q', 'K'
      @card_value = 10
    else
      @card_value = rank.to_i
    end
    add_to_score
    @cards_drawn += 1
    if @cards_drawn < 2
      draw_card_player(@score)
    else
      hit_or_stay
    end

  end

  def dealer_turn
    card_drawn = @blackjack_deck.cards.shuffle.shift
    rank = card_drawn.rank
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "The dealer has drawn a #{rank}"
    case rank
    when 'A'
      if @dealer_score < 11
        @dealer_card_value = 11
      else 
        @dealer_card_value = 1
      end
    when 'J', 'Q', 'K'
      @dealer_card_value = 10
    else 
      @dealer_card_value = rank.to_i
    end
    add_to_dealer_score

    @dealer_cards_drawn += 1
    if @dealer_cards_drawn < 2
      dealer_turn
    elsif @dealer_score <= @score && @dealer_score < 17
      dealer_turn
    
    elsif @dealer_score > 21
      puts "Dealer busted!"
      win 
    elsif @dealer_score == @score && @dealer_score > 16
      tie
    elsif @dealer_score > 16 && @dealer_score < @score
      dealer_turn
    else 
      dealer_score   
      if @dealer_score > @score && @dealer_score < 22
      lose
    end
    end
  end

 def dealer_score
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "The dealer is currently at #{@dealer_score}"
 end

  def give_value_to_ace
    choice = gets.strip.to_i
    if choice == 11
      return 11
    elsif choice == 1
      return 1
    else 
      puts "Sorry that was not a valid choice, please type 1 or 11"
      give_value_to_ace
    end
  end

  def add_to_score
    @score += @card_value
  end

  def add_to_dealer_score
    @dealer_score += @dealer_card_value
  end

  def show_score
    puts "Your current score is #{@score}"
  end


  def hit_or_stay
    if @score == 21
      puts "Blackjack!"
      dealer_turn
    elsif @score > 21
      puts "Bust, dealer's turn"
      dealer_turn
    else
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Your current score is #{@score}, would you like to hit or stay? H/S"
      choice = gets.strip.downcase
      if choice == 'h'
        draw_card_player(@score)
      else
        dealer_turn
      end
    end
  end

  def win
    puts "You have won! Your money has been doubled"
    @bet += @bet
  end

  def lose
    puts "You have lost!  There goes your money"
    @bet -= (@bet*2)
  end

  def tie
    puts "You have tied, take your money back"
    @bet = bet
  end

  def return_money
    return @bet
  end
end

