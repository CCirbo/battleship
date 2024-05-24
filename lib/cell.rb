class Cell

    attr_reader :coordinate,
                :ship,
                :fired_upon

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def empty?
        @ship == nil
    end

    def place_ship(cruiser)
        @ship = cruiser
    end 

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        @fired_upon = true
        if !empty? 
            @ship.hit
        end           
    end

    def render(show_ship = false)
        if show_ship && !empty?
            "S"
        elsif @fired_upon == false
            "."  
        elsif @fired_upon && empty? 
            "M"   

        elsif @fired_upon && !empty? && @ship.sunk?
            "X"

        elsif @fired_upon && !empty? 
            "H"               
       
        end
    end

end

