require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'


RSpec.configure do |config|
    config.formatter = :documentation
  end

  RSpec.describe Ship do
    before(:each) do
        @cell = Cell.new("B4")
        @cell_1 = Cell.new("B4")
        @cell_2 = Cell.new("C3")
        @cruiser = Ship.new("Cruiser", 3)
    end

    it 'can exist' do
        expect(@cell).to be_an_instance_of(Cell)
        expect(@cell.coordinate).to eq("B4")
    end

    it 'checks if cell can hold a ship' do
        expect(@cell.ship).to eq(nil)
    end

    it 'checks to see if cell is empty' do
        expect(@cell.empty?).to eq(true) 
    end

    it 'can put a ship in place' do
        @cell.place_ship(@cruiser)
        expect(@cell.ship).to eq(@cruiser)
        expect(@cell.empty?).to eq(false) 

    end

    it 'knows when ship has been fired upon' do
        expect(@cell.fired_upon?).to eq(false)
        @cell.place_ship(@cruiser)
        @cell.fire_upon
        expect(@cell.ship.health).to eq(2)
        expect(@cell.fired_upon?).to eq(true)
    end

    it 'render if without a ship' do
        expect(@cell_1.render).to eq(".")
        @cell_1.fire_upon
        expect(@cell_1.render).to eq("M")
    end

    it 'should place another ship' do
        @cell_2.place_ship(@cruiser)
        expect(@cell_2.render).to eq(".")

        expect(@cell_2.render(true)).to eq("S")
        @cell_2.fire_upon
        expect(@cell_2.render).to eq("H")
    end

    it 'can tell if a ship has sunk' do
        @cell_2.place_ship(@cruiser)
        @cell_2.fire_upon
        expect(@cell_2.render).to eq("H")
        @cruiser.hit
        @cruiser.hit
        expect(@cruiser.sunk?).to eq(true)
        expect(@cell_2.render).to eq("X")

    end
  
end
 