require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

#create standard set of 52 cards
cards = []
suits = [:spades, :diamonds, :hearts, :clubs]
values = ["2","3","4","5","6","7","8","9","10","J","Q","K", "A"]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    
suits.each do |suit|
  values.each_with_index do |value, index|
      card = Card.new(suit, value, ranks[index])
        cards << card
  end
end

#create deck object of standard 52 card objects

full_deck = Deck.new(cards)

#shuffle and split deck evenly
deck1 = []
deck2 = []
full_deck.cards.shuffle
full_deck.cards.each_with_index do |card, index|
  if index.even? == true
    deck1 << card
  else
    deck2 << card
  end
end

p deck1.count
p deck2.count
