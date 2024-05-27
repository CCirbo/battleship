require './lib/cell'

class Board
      attr_reader :cells
      
    def initialize
        @cells = populate_board_with_cells
    end 

    def populate_board_with_cells
        hash = {}
        ("A".."D").each do |letter|
          (1..4).each do |number|
            coordinate = letter + number.to_s
            hash[coordinate] = Cell.new(coordinate) 
          end
      end
      hash 
   
    end

    def valid_coordinate?(coordinate)
        @cells.has_key?(coordinate)
    end

    def valid_placement?(ship, coordinates)
        #checks valid coordinates
        coordinates.each do |coordinate|
          return false unless valid_coordinate?(coordinate)
        end
        # checks ship length vs coord length
        return false unless ship.length == coordinates.length
        # return false unless consecutive coordinates
        return false if ships_overlap?(coordinates)
        coordinates_consecutive?(coordinates)
        # the above returns false for diagonal too so no need to write separate method
    end
  
      private
      def coordinates_consecutive?(coords)
        # rows is an array of letters
          rows = coords.map {|coord| coord[0]}  
        # columns is an array of numbers
          columns = coords.map {|coord| coord[1]} 
      #  binding.pry
        successive?(rows) && same_character?(columns) || successive?(columns) && same_character?(rows)
      end

      def successive?(character_array)
          character_array.each_cons(2).all? do |character|
          # binding.pry
          character[0].succ == character[1]
        end
      end   

      def same_character?(character_array)
      # binding.pry
          character_array.uniq.length == 1
      end

      def ships_overlap?(coordinates)
          coordinates.any? {|coordinate| @cells[coordinate].ship}
      end

      public
    def place_ship(ship, coordinates)
        coordinates.each do |coordinate|
        cell = @cells[coordinate]
        cell.place_ship(ship)
        end
    end

    def render(show_ship = false)
      string_output = "  1 2 3 4 \n" 
      ("A".."D").map do |letter|
       string_output += letter + " "
        (1..4).map do |number|
          coord = letter + number.to_s
          string_output += @cells[coord].render(show_ship)
          string_output += " " unless number == 4
        end
        string_output += " \n"
      end
     string_output
# start with output string with the heaeder row, these are the columns
#  then nested loops to make each row of the board, so A..D for the first part
# build a row string with the letter and a space. Then the second part is
# iterating over the column numbers 1-4, and makes the coords by combining the row
# letter and the column number and into a string. Then gets the string representation
# of the cell at the coord by calling the @cells[coord]. the render method from cell class returns
# a character representing the cells state and we add a space between the cell unless
# it is at the number 4. Then we have to add a new line and then show the string output should
# be the board grid.

  end
end


