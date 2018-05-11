
### Home_menu
    #my_str = %q(
    #\nWelcome! Great news, you only have to make one choice to be a winner. 
    #\nThis is a game of 50/50. The concept is simple but the stakes are high.
    #\nA deck is composed of 52 cards, half are black and half are red.
    #...Instructions to follow.
    #1 + 1 + 1 + 1 is #{1 + 1 + 1 + 1}.
    #)
    # => "\nThis is the first line. \nThis is the second line. \n1 is 2. \n"
    #  

##Class
    #Class rough
    #Integers Kyle, Ryan, Seth, Johnathn


#Method 
#Question Player Info
#Method 1_Rouge Joe Menu
    #class 
    #
    #def initialize (player)    

    #def initialize
        #@player = [roughjoe] 
        #sickjoe_menu
    #end

    #def sickjoe_menu
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
    
    #Ask user if they are ready    
    #when player says ready to play pretend to shuffel 
   
     #def get_user_input
        #choices = gets.to_i
        #case choices
        #when 1
            #Tbd.new(self)
        #when 2
            #TBD.new(self)
        #end 

        #main_menu
    #end
    
#Method 2_Game choices menu (bets)
    #def initialize
        #@wager = [yourlife] 
        #yourlife_menu
    #end

    #def yourlife_menu
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
        #puts "1/n lsdkjflsd"
        #prints "lasjdfl"
   
     #def get_user_input
        #choices = gets.to_i
        #case choices
        #when 1
            #Tbd.new(self)
        #when 2
            #TBD.new(self)
        #end 

        #main_menu
    #end   
    
#---------GAME BEGINS-------------
#Ask user if they are ready    
    #when player says ready to play pretend to shuffel 
#---------GAME BEGINS-------------
#Method 3
# Method_Game_Red_Blue
    #?
    #take input
    #puts result
    #take modifier


    #def red
    #(1,2,3,4,5,6,7,8)
    #to.i
    # if <
    #end


    #def black
    #(1,2,3,4,5,6,7,8)
    #to.i
    #if >
    #end

      #def initialize (bet)
        #@redblue = []
        #redblue_menu
    #end
    #def redblue_menu
        #puts "1) Welcome to   "
        #puts "2)   "
        #get_user_input
    #end

    #def get_user_input
        #choices = gets.to_i
        #case choices
        #when 1
            #Tbd.new(self)
        #when 2
            #TBD.new(self)
        #end 

        #main_menu
    #end
    #end
    #




#___________________________________________________________________________
#--------------QUESTIIONS__________________________________________________
#--------------------------------------------------
#rand = 0-5 so to get to 6 add (+1)
#initialize (integer of: roll) = will do whatever is in the method
#d = Dice.new = (defines in class)
#d.show_dice = (calls the class/method?)
#puts
#d.show_sum = (calls the class/method?)
# why did he use size? in @ranks.size.times do |i| (note: what is being picked is below in color and @cards)
                            #color = (suits)
                            #@cards << Cards


#-------------------------------------------
#------------------Notes----------------------
#def generate_deck
    #@suits.each do |suit|

#--------------------------------------------------------------------
# ------------   50 50 Game 
#_____________________________________________________________________



require_relative 'cards.rb'
require_relative 'person.rb'


class Redwinner

    attr_accessor :redblue


    def initialize (bet)
        @redblue = []
        redblue_menu
    end


    def redblue_menu
        puts "1) Welcome to   "
        puts "2)   "
        get_user_input
    end

    def get_user_input
        choices = gets.to_i
        case choices
        when 1
            #Tbd.new(self)
        when 2
            #TBD.new(self)
        end 

        main_menu
    end

#game.bet.new

#case


#class Game
#    attr_accessor :?
#
#   def initialize(?)
#        @app = app
#    end
#
#    def add_to_cart(item)
#        @app.cart << item
#    end
#
#    def remove_from_cart(item)
#    end
#end
    