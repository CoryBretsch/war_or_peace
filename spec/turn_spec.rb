require 'spec_helper'

RSpec.describe Turn do
  it "exists" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn).to be_a Turn
  end

  it "has readable attributes" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.player1).to eq player1
    expect(turn.player2).to eq player2
    expect(turn.spoils_of_war).to eq []
  end

  it "has type :basic" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.type).to eq :basic
  end

  it "has type :war" do 
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.type).to eq :war
  end

  it "has type :mutually_assured_destruction" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
  
    expect(turn.type).to eq :mutually_assured_destruction
  end

  it "can have a winner when type :basic" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
      
    expect(turn.winner).to eq(player1)
  end

  it "can have a winner when type :war" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(player2)
  end

  it "can have a winner when type :mutually_assured_destruction" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq("No Winner")
  end

  it "can pile cards when type :basic" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    
    expect(turn.pile_cards).to eq [card1, card3]
    expect(player1.deck.cards).to eq [card2, card5, card8]
    expect(player2.deck.cards).to eq [card4, card6, card7]
  end

  it "can pile cards when type :war" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards
    expect(turn.spoils_of_war).to eq [card1, card2, card5, card4, card3, card6]
  end

  it "can remove 3 cards from deck when type :mutually_assured_destruction" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, '8', 8)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card4, card3, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards
      
    expect(turn.spoils_of_war).to eq []
    expect(player1.deck.cards).to eq [card8]
    expect(player2.deck.cards).to eq [card7]
  end

  it "can award spoils to winner deck turn :basic" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)   
    card3 = Card.new(:heart, '9', 9)   
    card4 = Card.new(:diamond, 'Jack', 11)   
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)   
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)   
    deck1 = Deck.new([card1, card2, card5, card8])    
    deck2 = Deck.new([card3, card4, card6, card7])    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
      
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
  
    expect(player1.deck.cards.length).to eq 5
    expect(player2.deck.cards).to eq [card4, card6, card7]
  end

  it "can award spoils to winner deck turn :war" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    expect(player1.deck.cards.count).to eq 1
    expect(player2.deck.cards.count).to eq 7
  end
end