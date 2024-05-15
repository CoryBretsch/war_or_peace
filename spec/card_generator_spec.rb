require 'spec_helper'

RSpec.describe CardGenerator do
  it 'exists' do
    suits = [:spades, :diamonds, :hearts, :clubs]
    values = ["2","3","4","5","6","7","8","9","10","J","Q","K", "A"]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    card_generator = CardGenerator.new(suits, values, ranks)
    
    expect(card_generator.cards).to all(be_an_instance_of Card)
    expect(card_generator.cards.count).to eq 52
  end

  
end



