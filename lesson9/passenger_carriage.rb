class PassengerCarriage < Carriage
  def initialize
    super
    validate!
    check_passenger!
  end

  private

  def check_passenger!
    raise 'Не указано количество мест' if @capacity.zero?
  end
end
