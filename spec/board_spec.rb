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
    end

  it 'can exist' do
    expect(@board).to be_an_instance_of(Board)
    expect(@board.cells).to be_an_instance_of(Hash)
    expect(@board.cells.length).to eq(16)
    expect(@board.cells["A1"]).to be_an_instance_of(Cell)
    expect(@board.cells["D4"]).to be_an_instance_of(Cell)
  end

  it 'can validate coordiante' do
    expect(@board.valid_coordinate?("A1")).to be true
    expect(@board.valid_coordinate?("D4")).to be true
    expect(@board.valid_coordinate?("A5")).to be false
    expect(@board.valid_coordinate?("E1")).to be false
    expect(@board.valid_coordinate?("A22")).to be false
  end

end