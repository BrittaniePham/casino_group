#require 'pry'

class Roulette

def initialize
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
  puts '========================================'
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
    puts "Pick a number between 1 and 36, in roulette you can also pick 0 or 00!"
    num_bet = gets.to_i
  if num_bet == @index.sample
    puts "Incredible, you win! You are the roulette master!"
  else
    puts "Ouch wah-wah! You have lost everything!"
 end
end


 def color
  if @colorchoice == @color.sample
    puts "You're a winner!"
    return 50
  else
    puts "You have lost pretty horrifically, sorry."
  end
end


end
