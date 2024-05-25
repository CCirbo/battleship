require 'rspec'
require 'pry'
require './lib/board'
require './lib/ship'

RSpec.configure do |config|
    config.formatter = :documentation
  end

  RSpec.describe Board do
    before(:each) do
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

  it 'can exist' do
    expect(@board).to be_an_instance_of(Board)
    expect(@board.cells).to be_an_instance_of(Hash)
    expect(@board.cells.length).to eq(16)
    expect(@board.cells["A1"]).to be_an_instance_of(Cell)
    expect(@board.cells["D4"]).to be_an_instance_of(Cell)
  end

  it 'can validate coordinate' do
    expect(@board.valid_coordinate?("A1")).to be true
    expect(@board.valid_coordinate?("D4")).to be true
    expect(@board.valid_coordinate?("A5")).to be false
    expect(@board.valid_coordinate?("E1")).to be false
    expect(@board.valid_coordinate?("A22")).to be false
  end

  it 'can check if there is a valid placement of ship object' do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'can check if the first character of '

  it 'can check if the coordinates are consecutive' do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@cruiser ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine ["C1", "B1"])).to eq(false)
    
  end
  


end