class Gamer
  FIRST_MONEY = 100
  attr_accessor :money, :used_cards

  def initialize
    @money = FIRST_MONEY
    @used_cards = []
  end

  def score
    total = used_cards.map(&:values).reduce(0, :+)

    if total > 21
      used_cards.count(&:ace?).times do
        total -= 10 if total > 21
      end
    end
    total
  end
end
