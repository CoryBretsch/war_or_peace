require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.configure do |config|
  config.formatter = :documentation
end