class Wallet
  attr_accessor :wallet
  def initialize
    @wallet = 100.00
  end

  def show_wallet
    puts "Your current balance is #{@wallet}"
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
    puts "Congratulations! You started with $100.00, but you are leaving with $#{@wallet}!"
  end

end