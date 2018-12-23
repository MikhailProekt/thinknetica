class Station
  include InstanceCounter
  include Validation

  NAME_STATION_FORMAT = /^[a-zа-я0-9]{3,}$/i.freeze

  validate :name, :presence
  validate :name, :format, NAME_STATION_FORMAT

  @@all_stations = []

  def self.all
    @@all_stations
  end

  attr_reader :station_name, :trains_list

  def initialize(station_name)
    @@all_stations.push(self)
    @station_name = station_name
    validate!
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

  def stations_trains
    trains.each do |train|
      yield(train)
    end
  end
end
