class Carriage
  include CompanyManufacturer

  attr_reader :number
  def initialize(number)
    @number = number
  end
end
