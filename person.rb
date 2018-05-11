require_relative 'wallet'
require_relative 'casino_war'
require_relative 'roulette'
require 'pry'

class Person
  attr_accessor :person_wallet 

  def initialize
    @person_wallet = Wallet.new
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "You find yourself in a casino and you have a massive gambling problem"
    puts "You currently have $100 in your pocket"
    puts "Are you ready to begin? Y/N"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    gets.strip == "Y" ? choose_game : (puts "K let's start over" ; initialize)

  end

 #send people here after they play a game, show them their wallet and then let them choose next game
  def casino_floor
    puts "Welcome back!"
    @person_wallet.show_wallet
    choose_game
  end

  #This menu will pop up anytime the user is sent back to the 'casino-floor', it will allow them to choose the game they want to play
  def choose_game
    puts "Please choose from the following options:"
    puts "1) Roulette"
    puts "2) Casino War"
    puts "3) Black or Red"
    puts "4) Slots"
    puts "5) Show wallet balance"
    puts "6) Cash out and leave"
    answer = gets.strip.to_i
    case answer
    when 1
      play_roulette
    when 2
      play_casino_war
    when 3
    when 4
    when 5
      @person_wallet.show_wallet
      choose_game
    when 6
      @person_wallet.final_wallet
      exit
    end
  end

  def play_casino_war
    puts "How much would you like to bet?"
    bet = gets.to_f
    casino_war_game = CasinoWar.new(bet)

  end

  def play_roulette
    puts "How much would you like to bet?"
    bet = gets.to_f
    roulette = Roulette.new(bet)
  end




end

player1 = Person.new