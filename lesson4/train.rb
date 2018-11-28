class Train

  attr_accessor :speed, :station
  attr_reader :number, :carriages, :route

  def initialize(number)
    @number = number >= 0 ? number : 0
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

  def set_route(route)
    @route = route
    @station = 0
  end

  def move_next_station
    return if @station == @route.stations.size - 1
    if @station.nil?
      @station = 0
    else
      @station += 1
    end  
    @route.stations[@station].add_train(self)
    @route.stations[@station - 1].send_train(self) 
  end

  def move_previous_station
    return if @station == 0
    if @station.nil?
      @station = @route.stations.size - 1
    else
      @station -= 1
    end
    @route.stations[@station].add_train(self)
    @route.stations[@station + 1].send_train(self)
  end

  def next_station
    @station + 1 <= @route.stations.size - 1 ? station + 1 : @station
  end

  def previous_station
    @station - 1 >= 0 ? station - 1 : @station
  end

  def current_station
    @route.stations[@station]
  end
end
