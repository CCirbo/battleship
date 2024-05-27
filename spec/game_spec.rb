require 'rspec'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Game do
    describe "start" do
        it "displays main menu and asks for input" do
            game = Game.new
            allow(game).to receive(:puts)
            allow(game).to receive(:gets).and_return('q')
            expect { game.start }.to output(/Welcome to BATTLESHIP/).to_stdout
        end
    end
end
