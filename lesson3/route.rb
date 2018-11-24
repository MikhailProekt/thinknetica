class Route

  attr_reader :route_list

  def initialize(start_station, end_station)
    @route_list = [start_station, end_station]
  end

  def add_middle_station(station)
    @route_list.insert(-2, station)
  end

  def delete_middle_station(station)
    @route_list.delete(station)
  end

  def show_route
    puts "#{@route_list}"
  end
end
