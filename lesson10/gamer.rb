class Gamer
  FIRST_MONEY = 100
  attr_accessor :money, :used_cards

  def initialize
    @money = FIRST_MONEY
    @used_cards = []
  end

  def score
    count = used_cards.map(&:values).reduce(0, :+)

    if count > 21
      aces = used_cards.select { |card| card.name == 'T' }
      aces.size.times do
        count -= 10
        return count if count <= 21
      end
    end
    count
  end
end
