class Gamer
  FIRST_MONEY = 100
  attr_accessor :money, :used_cards

  def initialize
    @money = FIRST_MONEY
    @used_cards = []
  end

  def count_values
    count = 0
    used_cards.each do |card|
      count += card.values
    end

    return count if count <= 21

    used_cards.each do |card|
      count = count - card.values + card.other_values if count > 21 && !card.other_values.nil?
    end
    count
  end
end
