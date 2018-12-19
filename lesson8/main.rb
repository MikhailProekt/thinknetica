require_relative 'company_manufacturer'
require_relative 'instance_counter'
require_relative 'verification'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'route'
require_relative 'station'

require_relative 'operator'
# require_relative 'test'

operator = Operator.new
operator.manage
