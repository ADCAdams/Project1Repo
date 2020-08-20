require_relative './Stock.rb'
require_relative './Investor.rb'

class CLI_Stock_Game

    attr_accessor :name, :player 

    def initialize
        intro
    end


    def intro

        # time = Time.new 
        # puts time.day
        # puts time.

        puts "Welcome shrewd investor! What is your name?"
        user_input_name = gets.strip
        @name = user_input_name
        puts "Hi, #{@name}!"
        sleep(2)
        puts "In this game we'll be using real-time stock market data."
        puts "You can choose to buy and sell any stock you like!"
        
        @player = Investor.new(@name)
        sleep(4)
        
    end


    def play
        puts "------------------------------------------------------------------------------------"
        puts "#{@name}, you have $#{@player.cash} and #{@player.stocks.length} different stocks."
        sleep(2)
        puts "* * * * * * * * * * * * * * * * "
        puts "You can choose to:"
        puts "'buy'     - buy shares of a stock" 
        puts "'sell'    - sell a stock you own" 
        puts "'cash'    - check how much cash you have available"
        puts "'learn'   - learn details about any stock" 
        puts "'shares'  - see how many shares you have of owned stocks"
        puts "or 'quit'"
        puts "* * * * * * * * * * * * * * * * "
        case gets.strip 
        when "buy"
            buying
        when "quit"
            exit
        when "shares"
            shares
        else
            puts "Please choose by typiing either 'buy', 'sell', 'cash', 'learn',  or 'quit'."
        end

    end

    def buying
        
        puts "Okay! lets buy some stocks!"
        sleep(1)
        puts "Using the ticker symbol, which stock would you like to buy? (e.g. AAPL or TSLA)"
        user_input_stock = gets.strip
        puts "And how many shares of #{user_input_stock} would you like to buy?"
        user_input_shares = gets.strip
        user_input_shares = user_input_shares.to_i

        @player.buy_stock(user_input_stock,user_input_shares)
        play
    end                             #ends buying
    
    def shares
        puts "Which stock would you like to look at?"
        user_input_stock = gets.strip
        stock_symbol = user_input_stock.upcase
        index = @player.check_if_owned(stock_symbol)
        if index != false
            puts "You have #{@player.stocks[index].shares} shares of #{stock_symbol}."
        else
            "You do not own this stock."
        end
        play
    end

    def learning
        puts "You can see:"
        puts "  * 'name' Company Name"
        puts "  * 'address' Company Address"
    end

end

