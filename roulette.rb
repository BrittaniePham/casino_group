#require `pry`

class Roulette

def initialize
  @index = [0, 00, 2, 4, 7, 9, 10, 12, 15, 17, 18, 20, 23, 25, 26, 28, 31, 33, 34, 36, 1, 3, 5, 6, 8, 11, 13, 14, 16, 19, 21, 22, 24, 27, 29, 30, 32, 35]

# binding.pry
# @wheel = [{1 => 'black', 2 => 'red'}]
# @color = ["red", "black"]
 @spins = []
 @color = ['Red', 'Black']
 place_bet
end

def place_bet
  puts "Place your bet:"
  puts "1) Red or 2) Black"
  print "> "
  bet = gets.to_i
  if bet == 1
    @colorchoice = 'Red'
  else
    @colorchoice = 'Black'
  end
  color
 end

 def color
  if @colorchoice == @color.sample
    puts "You win"
  else
    puts "You Lose"
  end
end

def spin
  x = rand(37)
end

end

Roulette.new