require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Game

    def initialize
        start
    end

    def display_main_menu
        puts "Welcome to BATTLESHIP"
        puts "Enter 'p' to play or 'q' to quit."
    end

    def start
       
            display_main_menu
            # choice = gets
            
            choice = gets.chomp.downcase
            case choice
            when 'p'
                play_game
            when 'q'
                puts "Exiting game. Goodbye!"
                
            else
                puts "Invalid please enter 'p' to play or 'q' to quit."
       
    end
end

end   