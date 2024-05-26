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
     coordinates_consecutive?(coordinates)
    # the above returns false for diagonal too so no need to write separate method
  end
  
  def coordinates_consecutive?(coords)
    # rows is an array of letters
    rows = coords.map {|coord| coord[0]}  
    # columns is an array of numbers
    columns = coords.map {|coord| coord[1]} 
    # this is for the horizontal position


    vertical_row_check = rows.each_cons(2).all? do |row|
        # checks that the succesion of index 0 is equal to the value of index 1
        row[0].succ == row[1]
      
    end
    vertical_column_check = columns.uniq.length == 1

    horizontal_row_check = columns.each_cons(2).all? do |column|
      # checks that the succesion of index 0 is equal to the value of index 1
      column[0].succ == column[1]
    
    end
    horizontal_column_check = rows.uniq.length == 1

    if vertical_row_check && vertical_column_check
      return true
    elsif horizontal_row_check && horizontal_column_check
      return true
    else
      return false
    end
    # check succession of rows is valid && columns are a single character(is this a 
    # valid vert placement) 
    # || the succession of columns is valid (1,2,3) && the rows are the same character, 
    # this is checking valid horazontal placement

  end
          
end
