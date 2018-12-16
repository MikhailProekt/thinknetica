class Carriage
  include CompanyManufacturer
  include Verification

  # Номер вагона - только число
  NUMBER_CARRIAGE = /^\d+$/

  attr_reader :number, :capacity
  attr_accessor :occupied_capacity

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @occupied_capacity ||= 0
    check!
  end

  private

  def check!
    raise 'Неверный формат номера' if @number.to_s !~ NUMBER_CARRIAGE || @number.zero?
  end
end
