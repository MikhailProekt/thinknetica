class Bank
  RATE = 10
  attr_reader :rate
  attr_accessor :money

  def initialize
    @rate = RATE
    @money = 0
  end
end
