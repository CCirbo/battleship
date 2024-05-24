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

  
end
 