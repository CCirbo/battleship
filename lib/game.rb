require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class Game

    def initialize
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @computer_board = Board.new
        @player_board = Board.new
        start
    end

    def display_main_menu
        puts "Welcome to BATTLESHIP"
        puts "Enter 'p' to play or 'q' to quit."
    end

    def start
       display_main_menu
            choice = gets.chomp.downcase
            case choice
            when 'p'
                play_game
            when 'q'
                puts "Exiting game. Goodbye!"
               exit 
            else
                puts "Invalid please enter 'p' to play or 'q' to quit."
                self.start
            end
           
    end
    def play_game
        computer_ship_placement(@computer_cruiser)
        computer_ship_placement(@computer_submarine)
        player_ship_placement_prompt
        player_ship_placement(@player_cruiser, 0)
        player_ship_placement(@player_submarine, 1)
    end
    def computer_ship_placement(ship)
        random_coords = @computer_board.cells.keys.sample(ship.length)
        until @computer_board.valid_placement?(ship, random_coords)
            random_coords = @computer_board.cells.keys.sample(ship.length) 
        end
        @computer_board.place_ship(ship, random_coords)     
    end
    def player_ship_placement_prompt
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
    end
    def player_ship_placement(ship, show)
       
        show == 0 ? (puts @player_board.render) : (puts @player_board.render(true))
        puts "Enter the squares for the #{ship.name} (#{ship.length} spaces (ie. A1, A2, A3)):"
        user_input = gets.chomp.upcase.split(", ")
        until @player_board.valid_placement?(ship, user_input)
            puts "Invalid placement. Must be consecutive and not diagonal"
            user_input = gets.chomp.upcase.split(", ")
        end
        @player_board.place_ship(ship, user_input)
        puts "Your #{ship.name} has been placed."
    end

    
        
    

end

  