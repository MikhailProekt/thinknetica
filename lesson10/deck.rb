class Deck
  attr_reader :cards

  def initialize
    @cards = Card::LEARS.each_with_object([]) do |lear, cards|
      Card::CARDS_VALUES.each do |name_card, values|
        other_values = Card::CARDS_OTHER_VALUES[name_card]
        card = Card.new(lear, name_card, values, other_values)
        cards << card
      end
    end.shuffle!
  end
end
