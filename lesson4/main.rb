require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriages'
require_relative 'passenger_carriages'
require_relative 'cargo_carriages'
require_relative 'route'
require_relative 'station'

require_relative 'operator'

operator = Operator.new
operator.manage
