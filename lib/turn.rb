class Turn 
  attr_reader :player1,
              :player2,
              :spoils_of_war


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0)== player2.deck.rank_of_card_at(0) && 
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else 
      :basic
    end
  end

  def winner 
    if type == :basic
      find_player(0)
    elsif type == :war
      find_player(2)
    else
      "No Winner"
    end
  end

  def find_player(card_position)
    player_rank_hash = {player1 => player1.deck.rank_of_card_at(card_position),
                        player2 => player2.deck.rank_of_card_at(card_position)}
    player_rank_hash.max_by{|player, rank_of_card| rank_of_card}[0]
  end

  def pile_cards
    if type == :basic 
      pile_cards_helper(player1)
      pile_cards_helper(player2)
    elsif type == :war
      3.times do
        pile_cards_helper(player1)
      end
      3.times do
        pile_cards_helper(player2)
      end
    else
      3.times do
        player1.deck.remove_card
      end
      3.times do
        player2.deck.remove_card
      end
    end
  end

  def pile_cards_helper(player)
    spoils_of_war << player.deck.remove_card
  end

  def award_spoils(winner)
    winner.deck.add_card(spoils_of_war)
  end
end