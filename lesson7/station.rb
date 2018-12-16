class Station
  include InstanceCounter
  include Verification

  @@all_stations = []

  def self.all
    @@all_stations
  end

  attr_reader :station_name, :trains_list

  def initialize(station_name)
    @@all_stations.push(self)
    @station_name = station_name
    check!
    @trains_list = []
    register_instance
  end

  def add_train(train)
    @trains_list.push(train)
  end

  def show_trains_list
    puts @trains_list
  end

  def trains_list_type(type = nil)
    if type.nil?
      @trains_list
    else
      @trains_list.select { |train| train.type == type }
    end
  end

  def send_train(train)
    @trains_list.delete(train)
  end

  def stations_trains(&block)
    trains.each do |train|
      yield(train)
    end
  end

  private

  def check!
    raise 'Название станции должно быть больше 2 символов' if @station_name.length < 3
  end
end
