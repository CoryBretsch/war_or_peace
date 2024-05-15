require 'spec_helper'

RSpec.describe Game do
  it 'exists' do
    suits = [:spades, :diamonds, :hearts, :clubs]
    values = ["2","3","4","5","6","7","8","9","10","J","Q","K", "A"]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    game = Game.new(suits, values, ranks)

    expect(game).to be_a Game
  end

  

end