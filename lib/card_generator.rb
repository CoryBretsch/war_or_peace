class CardGenerator
  attr_reader :cards

  def initialize(suits, values, ranks)
    @cards = make_cards(suits, values, ranks)
  end

  def make_cards(suits, values, ranks)
    suits.each_with_object([]) do |suit, deck|
      values.each_with_index do |value, index|
        card = Card.new(suit, value, ranks[index])
        deck << card
      end
    end
  end

end