class CargoCarriage < Carriage
  attr_reader :number, :volume
  attr_accessor :taken_volume

  def initialize(number, volume)
    super(number)
    @volume = volume
    @taken_volume ||= 0
    check_cargo!
  end

  private

  def check_cargo!
    raise 'Не указан объем!' if @volume.zero?
  end
end
