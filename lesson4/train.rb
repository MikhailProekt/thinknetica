class Train

  attr_accessor :speed, :station
  attr_reader :number, :carriages, :route

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
    @route
    @station
  end

  def add_speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def current_speed
    speed
  end

  def add_carriages(carriage)
    @carriages.push(carriage) if speed.zero?
  end

  def delete_carriages(carriage)
    @carriages.delete(carriage) if speed.zero? && @carriages.any?
  end

  def route=(route)
    @route = route
    @station = route.stations.first
  end

  def move_next_station
    return if route.stations.index(station) == @route.stations.size - 1
    if @station.nil?
      @station = route.stations[0]
    else
      @station = route.stations[route.stations.index(station) + 1]
    end
    #@station = route.stations[route.stations.index(station)]

  end

  def move_previous_station
    return if route.stations[route.stations.index(station)] == 0
    if @station.nil?
      @station = route.stations[0]
    else
      @station = route.stations[route.stations.index(station) - 1]
    end
    #@station = route.stations[route.stations.index(station)]
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def previous_station
    route.stations[route.stations.index(station) - 1]
  end

  def current_station
    @station
  end
end
