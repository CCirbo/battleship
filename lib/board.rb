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

 
end