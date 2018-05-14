class Wallet
  attr_accessor :wallet

  #initialize new wallet when a new player enters the floor, start them at $100
  def initialize
    @wallet = 100.00
  end
  #show the current amount in player's wallet
  def show_wallet
    puts "-------------------------------"
    puts "Your current balance is $#{'%.2f' % @wallet}"
    puts "-------------------------------"
  end

  def lose_wallet(bet)
    @wallet -= bet
    show_wallet
  end

  def win_wallet(bet)
    @wallet += bet
    show_wallet
  end

  def final_wallet
    puts "----------------------------------------------------------------------------"
    puts "Congratulations! You started with $100.00, but you are leaving with $#{'%.2f' % @wallet.round(2)}!"
    puts "----------------------------------------------------------------------------"
  end

end