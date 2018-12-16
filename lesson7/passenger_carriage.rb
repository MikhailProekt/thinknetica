class PassengerCarriage < Carriage
  attr_reader :number, :number_of_places
  attr_accessor :taken_places

  def initialize(number, number_of_places)
    super(number)
    @number_of_places = number_of_places
    @taken_places ||= 0
    check_passenger!
  end

  private

  def check_passenger!
    raise 'Не указано количество мест' if @number_of_places.zero?
  end
end
