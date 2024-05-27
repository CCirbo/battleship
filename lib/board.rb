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
          succession?(rows) && same_character?(columns) || succession?(columns) && same_character?(rows)
      end

      def succession?(character_array)
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
end


