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
  puts "How do you want to bet?"
  puts "1) Outside"
  puts "2) Inside"
  puts
  puts "Outside bets have better odds, but lower payouts.  Inside bets are pretty risky,\nthey have sky high returns but devastating loses."
  print "> "
  bet_choice = gets.to_i
  if bet_choice == 1
    outside
  else
    inside
  end
end

def outside
  puts "========================================"
  puts "Let's place some outside bets!"
  puts "You can split your odds evenly or play the dozens."
  puts "1) Red or Black ----- odds = 50/50"
  puts "2) Play the Dozens -- odds = 2 to 1"
  print "> "
  outside_bet = gets.to_i
  if outside_bet == 1
    color
  else
    dozens
  end
end

def inside
  puts "=========================================="
  puts "Let's place some inside bets!"
  puts 
  puts "1) Straight up Bet ------- odds = 37 to 1"
  puts "2) Split Bet ------------- odds = 19 to 1"
  puts "3) Street Bet ------------ odds = 13 to 1"
  puts "4) Corner Bet ------------ odds = 10 to 1"
  bet_choice = gets.to_i
  case bet_choice
    when 1
      straight_up
    when 2
      split
    when 3
      street
    when 4
      corner
    else
      puts "Invalid Choice"
      inside
  end
end

#--------------------------------------------------------------------------------------

def color
  puts
  puts "===================== Red or Black ===================="
  puts "This is the classic bet in roulette, your odds are 50/50, what's it gonna be?"
  puts "1) Red"
  puts "2) Black"
  bet1 = gets.to_i
  case bet1
    when 1
      @colorchoice = 'Red'
      puts "------------------"
      puts "All on red , baby!"
      puts "------------------"
      win_or_lose
    when 2
      @colorchoice = 'Black'
      puts "-------------------"
      puts "All on black, baby!"
      puts "-------------------"
      win_or_lose
    else
      puts "Invalid Choice"
      color
    end
end
  
def win_or_lose
  which_color = @color.sample
  puts "........................."
  puts "Landed on #{which_color}!"
  puts "........................"
  if @colorchoice == which_color
    color_win
  else
    color_lose
  end
end

def color_win
  @bet = @bet + 20
  @player_money = @player_money + @bet
  puts "$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$ CASH $$"
  puts "Cha-Ching!  You're a winner!"
  puts "You just won 20 moneys! You're up to $#{@bet}!"
  puts "Just watch out for the mob, sometimes they break your legs when you win haha jk!"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def color_lose
  @bet = @bet - 20
  @player_money = @player_money - @bet
  puts "* * :( * * :( * * :( * * :( * * :( * * :( * * :( * * :( * * :( * * :( * *"
  puts "Ouch! You just lost 20 currency units! That sucks!"
  puts "You're down to $#{@bet}."
  puts "Well onward and upward, I guess."
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

#--------------------------------------------------------------------------------------

def dozens
  puts
  puts "======================================= The Dozens ====================================="
  puts
  puts "On a Roulette table, the 36 pockets on the wheel are represented on a grid, divided into 3 groups of 12."
  puts "You pick a group, and if the ball lands on the number within your range, you win!"
  puts "1) Low Dozen (1 -12)"
  puts "2) Middle Dozen (13 -24)"
  puts "3) High Dozen (25 - 36)"
  print "> "
  num = gets.to_i
  case num
    when 1
      arr_low = [1, 2, 3]
      arr_low.sample
      if num == arr_low.sample
        dozen_win
      else
        dozen_lose
      end
    when 2
      arr_mid = [1, 2, 3]
      arr_mid.sample
      if num == arr_mid.sample
        dozen_win
      else
        dozen_lose
      end
    when 3
      arr_high = [1, 2, 3]
      arr_high.sample
      if num == arr_high.sample
        dozen_win
      else
        dozen_lose
      end
    else
      puts "Invalid Choice"
      dozen
  end
end

def dozen_win
  @bet = @bet * 0.6
  @bet.to_i
  @player_money = @player_money + @bet
  puts "You won $#{@bet}!"
end

def dozen_lose
  @bet = @bet / 0.6
  @bet.to_i
  @player_money = @player_money - @bet
  puts "You lost, sucka! You've got $#{@bet} now!"
end

#--------------------------------------------------------------------------------------


def straight_up
  puts "~~~~~~~~~~~~~~~~~~~~~~~~ Straight Up ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts
  puts "This is the riskiest bet in Roulette"
  puts "Pick any single number between 1 and 36, 0 (zero), or 00 (double zero)"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
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
  @bet = @bet * 3.0
  @player_money = @player_money + @bet
  puts "$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$$$ CASH $$$$"
  puts "Incredible, you win! You are the roulette master!"
  puts "Make it Rain!! You just tripled your cash!!"
  puts "You you're up to $#{@bet}!"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "You're on a streak!"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

def num_lose
  @bet = @bet / 3.0
  @player_money = @player_money - @bet
  puts "* :( * * :( * * :( * * :( * * :( * * :( *"
  puts "Yeah obviously you lost, that's the dumbest bet you can make."
  puts "Like, damn... You're down to $#{@bet}."
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "Better luck next time."
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

#---------------------------------------------------------------------------------------

def split
  puts "+++++++++++++++++++++++++++ Split Bet ++++++++++++++++++++++++++++++"
  puts
  puts "With this bet you marginally increase your odds by picking any two numbers."
  puts "If the ball lands in either of those pockets, you win!"
  puts "Pick your first number between 1 and 36, don't forget you can pick 0 (zero) or 00 (double zero) too."
  print "> "
  first_num = gets.to_i
  puts "Now pick your second number"
  print "> "
  sec_num = gets.to_i
  x = @index.sample
  y = @index.sample
  if first_num == x || sec_num == y
    split_win
  else
    split_lose
  end
end

def split_win
  @bet = @bet * 2.0
  @player_money = @player_money + @bet
  puts "Daaaang, you won! You got $#{@bet}!"
end

def split_lose
  @bet = @bet / 2.0
  @player_money = @player_money - @bet
  puts "You lost, I mean it is gambling.  You now have $#{@bet}."
end

#--------------------------------------------------------------------------------------

def street
  puts "---------------------------- Street Bet ----------------------------"
  puts
  puts "With this bet you slightly increase your odds by picking any three numbers."
  puts "If the ball lands in any of those pockets, you win!"
  puts "Pick your first number between 1 and 36, don't forget you can pick 0 (zero) or 00 (double zero) too."
  print "> "
  first_num = gets.to_i
  puts "Now pick your second number."
  print "> "
  sec_num = gets.to_i
  puts "Now pick your third number."
  print "> "
  third_num = gets.to_i
  x = @index.sample
  y = @index.sample
  z = @index.sample
  if first_num == x || sec_num == y || third_num == z
    street_win
  else
    street_lose
  end
end

def street_win
  @bet = @bet * 3.0
  @player_money = @player_money + @bet
  puts "That's pretty crazy, you actually won"
  puts "How does that $#{@bet} feel, winner?"
end

def street_lose
  @bet = @bet / 3.0
  @player_money = @player_money - @bet
  puts "Bummer you lost pretty hard!"
  puts "You're down to $#{@bet}."
end

#--------------------------------------------------------------------------------------
def corner
  puts "``````````````````````````` Corner Bet `````````````````````````````"
  puts 
  puts "With this bet you slightly increase your odds by picking any four numbers"
  puts "If the ball lands in any of those pockets, you win!"
  puts "Pick your first number between 1 and 36, don't forget you can pick 0 (zero) or 00 (double zero) too."
  print "> "
  first_num = gets.to_i
  puts "Now pick your second number."
  print "> "
  sec_num = gets.to_i
  puts "Now pick your third number."
  print "> "
  third_num = gets.to_i
  puts "Now pick your fourth number."
  print "> "
  four_num = gets.to_i
  a = @index.sample
  b = @index.sample
  c = @index.sample
  d = @index.sample
  if first_num == a || sec_num == b || third_num == c || four_num == d
    corner_win
  else
    corner_lose
  end
end

def corner_win
  @bet = @bet * 4.0
  @player_money = @player_money + @bet
  puts "Woot woot!  You got some buuuucks! You're at $#{@bet}!"
end

def corner_lose
  @bet = @bet / 4.0
  @player_money = @player_money - @bet
  puts "Crash and burn, well you suck.  You're down to $#{@bet}."
end

end

Roulette.new(1)