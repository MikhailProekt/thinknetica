class Carriage
  include CompanyManufacturer
  include Validation

  # Номер вагона - только число
  NUMBER_CARRIAGE = /^\d+$/.freeze

  attr_reader :number, :capacity
  attr_accessor :occupied_capacity

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @occupied_capacity ||= 0
    validate!
  end

  private

  def validate!
    raise 'Неверный формат номера' if @number.to_s !~ NUMBER_CARRIAGE || @number.zero?
  end
end
