class Carriage
  include CompanyManufacturer
  include Verification

  #Номер вагона - только число
  NUMBER_CARRIAGE = /^\d+$/

  attr_reader :number

  def initialize(number)
    @number = number
    check!
  end

  private

  def check!
    raise "Неверный формат номера" if @number !~ NUMBER_CARRIAGE 
  end
end
