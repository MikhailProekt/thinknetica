class Train

  attr_accessor :speed, :station
  attr_reader :number, :type, :carriages, :route

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def add_speed(speed)
    @speed += speed
  end

  def stop
    speed = 0
  end

  def current_speed
    speed
  end

  def add_carriages
    carriages += 1 if speed == 0 
  end

  def delete_carriages
    carriages -= 1 if speed == 0 && carriages > 0
  end

  def route=(route)
    @route = route
    station = route.stations.first
  end

  def move_next_station
    station = route.stations[route.stations.index(station) + 1]
  end

  def move_previous_station
    station = route.stations[route.stations.index(station) - 1]
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def previous_station
    route.stations[route.stations.index(station) - 1]
  end

  def current_station
    station
  end
end
