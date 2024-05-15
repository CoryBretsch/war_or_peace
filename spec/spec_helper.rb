require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

RSpec.configure do |config|
  config.formatter = :documentation
end