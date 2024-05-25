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
# @cells, ship and coordinate
    # @cells is a hash 
        # the keys are the coordinates such as "A1"
        # the values are the instance of the cell
        # class
    # ship is an instance of the ship class
        # attrs :  name, length, health,
        # methods: hit and sunk?
    # coordinate is an array that contains strings
        # ["A1", "A3"]

    # We want to make sure when we are placing our 
        # ships on the board that there is actual
        # valid space available.
    # Making sure ship length equals the coordinate length.
    
    # if ship coordinates are next to each other
        # than true, if not, it's false
    ship.length == coordinates.length
  end
  
  def are_coordinates_consecutive?(coordinates)

    consecutive --> horizontally or vertically
        - horizontally
            - does the first letter match
            - do the numbers increase by 1
        - vertically
                

#How do find if the coord are next to each other?
        # horizontally and vertically
    # For horizontally consecutive numbers to one
        # letter
    # is the ship

    # ship - attrs: name, length, health; methods: hit and sunk?
    # coordinate - ["A1", "A2", "A4"]

    # start with coordinate variable passed in
    # horizontally consecutive
        # make sure letter is the same
            # an array of two-char strings, first char is the same letter
                # need to iterate over the array and look at the first char
                #which letter and make sure it matches
                    # get the first char from the first element in array
                        # assign it variable char_to_verify
                   
                    char_to_verify = coordinates[0][0]
                    verified = nil
                    # iterate over array
                        # access first char in the string
                            # assign it to var to string_char
                        # check if string_char is the same as char_to_verify
                    coordinates.each do |coordinate|
                        # "a1"
                        string_char = coordinate[0]
                        if string_char == char_to_verify
                         # keep going
                            verified = true
                        else
                            # stop or end or fail the check
                            verified = false
                            break
                        end
                    end
                    return verified
  end 
                
                # make sure numbers increase by 1
                    # array of 2-char strings, sec char is digit increasing by one
           
end
