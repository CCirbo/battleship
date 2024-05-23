require 'rspec'
require 'pry'
require './lib/board'
require './lib/ship'

RSpec.configure do |config|
    config.formatter = :documentation
  end