require 'rspec'
require 'pry'
require './lib/ship'

RSpec.configure do |config|
    config.formatter = :documentation
  end

  RSpec.describe Ship do
    before(:each) do
        @cruiser = Ship.new("Cruiser", 3)
    end

    it 'can exists' do
        expect(@cruiser).to be_an_instance_of(Ship)
    end

    it 'has attributes' do
        expect(@cruiser.health).to eq(3)
    end

    it 'is checking to see if ship can be sunk' do
        expect(@cruiser.sunk?).to be false
    end

    it 'shows that a ship can be hit and sunk' do
        @cruiser.hit
        expect(@cruiser.health).to eq(2)
        expect(@cruiser.sunk?).to be false

        @cruiser.hit
        expect(@cruiser.health).to eq(1)
        expect(@cruiser.sunk?).to be false


        @cruiser.hit
        expect(@cruiser.health).to eq(0)
        expect(@cruiser.sunk?).to be true
    end

   
  end
  



