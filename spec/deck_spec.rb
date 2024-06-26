require 'spec_helper'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_a Deck
  end

  it "has readable attributes" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq ([card1, card2, card3])
  end

  it "can return rank of card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to be 12
    expect(deck.rank_of_card_at(2)).to be 14
  end

  it "can list high ranking cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq [card1, card3]
  end

  it "can give high card/deck ratio" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to be 66.67
  end

  it "can remove the top card" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq [card2, card3]
    expect(deck.high_ranking_cards).to eq [card3]
    expect(deck.percent_high_ranking).to be 50.0
  end

  it "can add a card to bottom of deck" do
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card2, card3]
    deck = Deck.new(cards)

    deck.add_card(card4)

    expect(deck.cards).to eq [card2, card3, card4]
    expect(deck.high_ranking_cards).to eq [card3]
    expect(deck.percent_high_ranking).to be 33.33
  end

    it "can build a static deck of cards" do
      cards = Card.new(suit, value, rank)

      
      suits = [:spades, :diamonds, :hearts, :clubs]
      values = ["2","3","4","5","6","7","8","9","10","J","Q","K", "A"]
      ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

      suits.each do |suit|
        values.each_with_index do |value, index|
            card = Card.new(suit, value, ranks[index])
              cards << card


    end
end