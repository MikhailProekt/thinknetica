class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = []
    @stations.push(start_station)
    @stations.push(end_station)
    register_instance
  end

  def add_middle_station(station)
    @stations.insert(@stations.size-1, station)
  end

  def delete_middle_station(station)
    @stations.delete(station) if @stations.first != station && @stations.last != station
  end

  def show_route
    puts @stations
  end
end
