class Card
  LEARS = ['+', '<3', '^', '<>'].freeze
  CARDS_VALUES = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'V' => 10,
    'D' => 10,
    'K' => 10,
    'T' => 11
  }.freeze

  CARDS_OTHER_VALUES = {
    'T' => 1
  }.freeze

  attr_accessor :lear, :name, :values, :other_values

  def initialize(lear, name, values, other_values)
    @lear = lear
    @name = name
    @values = values
    @other_values = other_values
  end
end
