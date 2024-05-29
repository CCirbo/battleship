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
      coordinates.each do |coordinate|
      return false unless valid_coordinate?(coordinate)
      end
      return false unless ship.length == coordinates.length
      return false if ships_overlap?(coordinates)
      coordinates_consecutive?(coordinates)
    end

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
  end
  
      private
    def coordinates_consecutive?(coords)
      rows = coords.map {|coord| coord[0]}  
      columns = coords.map {|coord| coord[1]} 
      successive?(rows) && same_character?(columns) || successive?(columns) && same_character?(rows)
    end

    def successive?(character_array)
      character_array.each_cons(2).all? do |character|
      character[0].next == character[1]
      end
    end   

    def same_character?(character_array)
      character_array.uniq.length == 1
    end

    def ships_overlap?(coordinates)
       coordinates.any? {|coordinate| @cells[coordinate].ship}
    end
end


