class Station

  attr_reader :station_name

  def initialize(station_name)
    @station_name = station_name
    @trains_list = []
  end

  def add_train(train)
    @trains_list << train
  end

  def show_trains_list
    @trains_list.each { |train| puts train }
  end

  def trains_list_type(type)
    counter = 0
    @trains_list.each { |train| counter +=1 if train.type.eql?(type) }
    puts "Количество поездов на станции #{station_name} типа #{type} равно #{counter}."
  end

  def send_train(train)
    @trains_list.delete(train)
  end
end

