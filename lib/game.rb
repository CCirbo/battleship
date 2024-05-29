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
        puts "Welcome to BATTLESHIP \n "
        puts "Enter 'p' to play or 'q' to quit."
    end

    def start
       display_main_menu
        choice = gets.chomp.downcase
        case choice
        when 'p'
            run_game
        when 'q'
            puts "Exiting game. Goodbye!"
            exit 
        else
            puts "Invalid please enter 'p' to play or 'q' to quit."
            self.start
        end
    end
   
    def run_game
        computer_ship_placement(@computer_cruiser)
        computer_ship_placement(@computer_submarine)
        player_ship_placement_prompt
        player_ship_placement(@player_cruiser, 0)
        player_ship_placement(@player_submarine, 1)
        play_game
    end
   
    def computer_ship_placement(ship)
        random_coords = @computer_board.cells.keys.sample(ship.length)
        until @computer_board.valid_placement?(ship, random_coords)
            random_coords = @computer_board.cells.keys.sample(ship.length) 
        end
            @computer_board.place_ship(ship, random_coords)     
    end
    
    def player_ship_placement_prompt
        puts "I have laid out my ships on the grid. \n "
        puts "You now need to lay out your two ships. \n "
        puts "The Cruiser is three units long and the Submarine is two units long. \n "
    end
    
    def player_ship_placement(ship, show)
        show == 0 ? (puts @player_board.render) : (puts @player_board.render(true))
            puts " \n Enter the squares for the #{ship.name} (#{ship.length} spaces (ie. A1, A2, A3)): \n "
            user_input = gets.chomp.upcase.split(", ")
        until @player_board.valid_placement?(ship, user_input)
            puts "Invalid placement. Must be consecutive and not diagonal"
            user_input = gets.chomp.upcase.split(", ")
        end
        @player_board.place_ship(ship, user_input)
        puts " \n Your #{ship.name} has been placed. \n "
    end

    def turn_start
        puts "==========COMPUTER BOARD========= \n "
        puts @computer_board.render
        puts " \n ==========PLAYER BOARD=========== \n "
        puts @player_board.render(true)
    end
    
    def player_turn_shot
        puts " \n Enter the coordinate for your shot: \n "
            user_input = gets.chomp.upcase
        until @computer_board.valid_coordinate?(user_input) && !@computer_board.cells[user_input].fired_upon?
            puts "You have already fired here.  Enter a new coordinate:"
            user_input = gets.chomp.upcase
        end
            @computer_board.cells[user_input].fire_upon
        puts @computer_board.render
        puts "Your shot on #{user_input} was a #{@computer_board.cells[user_input].render} \n "
    end

    def computer_turn_shot
            random_coords = @player_board.cells.keys.sample
        until @player_board.valid_coordinate?(random_coords) && !@player_board.cells[random_coords].fired_upon?
            random_coords = @player_board.cells.keys.sample
        end
            @player_board.cells[random_coords].fire_upon
        puts @player_board.render(true)
        puts "My shot on #{random_coords} was a #{@player_board.cells[random_coords].render} \n "
    end

    def play_game
        until [@computer_cruiser, @computer_submarine].all?(&:sunk?) || [@player_cruiser, @player_submarine].all?(&:sunk?)
            turn_start
            player_turn_shot
        break if [@computer_cruiser, @computer_submarine].all?(&:sunk?)
            computer_turn_shot
        end
        end_game
    end
    
    def end_game
        if [@player_cruiser, @player_submarine].all?(&:sunk?)
            puts "I Won! Let's play again! \n "
        else
            puts "You Won! Let's play again! \n "
        end
        start
    end
end

      
    

  