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
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def show_speed
    puts "#{self.speed}"
  end

  def add_carriages
    @carriages += 1 if self.speed == 0 
  end

  def delete_carriages
    @carriages -= 1 if self.speed == 0
  end

  def route=(route)
    @route = route
    self.station = self.route.route_list.first
  end

  def next_station
    self.route.route_list[self.route.route_list.index(self.station) + 1]
  end

  def previous_station
    self.route.route_list[self.route.route_list.index(self.station) - 1]
  end

  def current_station
    self.station = self.route.route_list[self.route.route_list.index(self.station) + 1]
  end
end
