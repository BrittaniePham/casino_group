#require 'pry'

class Roulette
attr_accessor :bet

def initialize(bet)
  @bet = bet
  @player_money = 0
  @index = [0, 00, 2, 4, 7, 9, 10, 12, 15, 17, 18, 20, 23, 25, 26, 28, 31, 33, 34, 36, 1, 3, 5, 6, 8, 11, 13, 14, 16, 19, 21, 22, 24, 27, 29, 30, 32, 35]
  @color = ['Red', 'Black']
  play
end

def play
  puts 
  puts "************** Roulette *****************"
  puts
  puts "Try your luck, spin the wheel, and prepare for big wins!"
  puts "Or maybe you'll lose it all because of your poor life choices!"
  puts
  puts '========================================='
  place_bet
end

def place_bet
  puts "Place your bet:"
  puts "1) Red\n2) Black\n3) Pick a single number"
  print "> "
  bet = gets.to_i
  case bet
  when 1
    @colorchoice = 'Red'
  when 2
    @colorchoice = 'Black'
  else
    number
  end
    color
end

def number
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "In Roulette you can pick a single number between 1 and 36, 0 (zero), or 00 (double zero)"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "The odds really suck for you when you do this but ok, what's your pick?"
  print "> "
  @num_bet = gets.to_i
  if @num_bet == @index.sample
    num_win
  else
    num_lose
  end
end

def num_win
  @bet = @bet * 3
  @player_money = @player_money + @bet
  puts "$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$"
  puts "Incredible, you win! You are the roulette master!"
  puts "Make it Rain!! You just tripled your cash!!"
  puts "You you're up to #{@bet}!"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "You're on a streak!"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def num_lose
  @bet = @bet / 3
  @player_money = @player_money - @bet
  puts "* :( * * :( * * :( * * :( * * :( * * :( *"
  puts "Yikes, didn't I tell you?"
  puts "You have lost pretty horrifically."
  puts "Like, damn... You're down to #{@bet}."
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "Better luck next time."
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def color
  if @colorchoice == @color.sample
    @bet = @bet + 20
    @player_money = @player_money + @bet
    puts "$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$"
    puts "Cha-Ching!  You're a winner!"
    puts "You just won 20 moneys! You're up to #{@bet}!"
    puts "Just watch out for the mob, sometimes they break your legs when you win haha!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  else
    @bet = @bet - 20
    @player_money = @player_money - @bet
    puts "* * :( * * :( * * :( * * :( * * :( * * :( * * :( * * :( * * :( * * :( * *"
    puts "Ouch! You just lost 20 currency units! That sucks!"
    puts "You're down to #{@bet}."
    puts "Well onward and upward, I guess."
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end
end

end

#Roulette.new(1)