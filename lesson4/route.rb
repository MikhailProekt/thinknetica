class Route

  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_middle_station(station)
    stations.insert(-2, station)
  end

  def delete_middle_station(station)
    stations.delete(station)
  end

  def show_route
    puts stations
  end
end
