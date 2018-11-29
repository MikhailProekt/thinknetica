class Station

  attr_reader :station_name, :trains_list

  def initialize(station_name)
    @station_name = station_name
    @trains_list = []
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
end
