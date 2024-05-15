class Game 
  attr_reader :cards,
              :deck1,
              :deck2,
              :player1,
              :player2,
              :turn
  
  def initialize(suits, values, ranks)
    @cards = CardGenerator.new(suits, values, ranks).cards.shuffle
    @deck1 = Deck.new(@cards.first(26))
    @deck2 = Deck.new(@cards.last(26))
    @player1 = Player.new('Carisa', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def start_game
    puts  "------------------------------------------------------------------" + "\n" +
          "Welcome to War! (or Peace) This game will be played with 52 cards." + "\n" +
          "The players today are Carisa and Aurora." + "\n" +
          "Type 'GO' to start the game!" + "\n" +
          "------------------------------------------------------------------"
    if gets.chomp == "GO"
      round = 0
      until round == 100001 || player1.has_lost? == true || player2.has_lost? == true
        turn = Turn.new(@player1, @player2)
        if turn.type == :mutually_assured_destruction
          round += 1
          turn.player1
          turn.player2
          winner = turn.winner
          spoils_of_war = turn.pile_cards
          if player1.has_lost? == true
            puts "--- Aurora has won! ---"
          elsif player2.has_lost? == true
            puts "--- Carisa has won! ---"
          elsif round == 100001
            puts "--- Draw ---"
          else
            puts "Round #{round}: MUTUALLY ASSURED DESTRUCTION -- 6 cards removed from play"
          end
        elsif turn.type == :war
          round += 1
          turn.player1
          turn.player2
          winner = turn.winner
          spoils_of_war = turn.pile_cards
          turn.award_spoils(winner)
          if player1.has_lost? == true
            puts "--- Aurora has won! ---"
          elsif player2.has_lost? == true
            puts "--- Carisa has won! ---"
          elsif round == 100001
            puts "--- Draw ---"
          else
            puts "Round #{round}: WAR -- #{winner.name} has won #{spoils_of_war.count} cards"
          end
        else
          round += 1
          turn.player1
          turn.player2
          winner = turn.winner
          spoils_of_war = turn.pile_cards
          turn.award_spoils(winner)
          if player1.has_lost? == true
            puts "--- Aurora has won! ---"
          elsif player2.has_lost? == true
            puts "--- Carisa has won! ---"
          elsif round == 100001
            puts "--- Draw ---"
          else
            puts "Round #{round}: #{winner.name} has won #{spoils_of_war.count} cards"
          end          
        end          
      end
    end
  end

end