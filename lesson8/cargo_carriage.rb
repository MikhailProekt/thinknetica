class CargoCarriage < Carriage
  def initialize
    super
    check_cargo!
  end

  private

  def check_cargo!
    raise 'Не указан объём!' if @capacity.zero?
  end
end
