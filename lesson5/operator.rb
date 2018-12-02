class Operator

  def initialize
    @trains = []
    @carriages = []
    @stations = []
    @routes = []
  end

  def manage
    loop do
      puts 'Введите число от 0 до 9 для выбора одного из пунктов меню:'
      puts '1.Cоздать станцию'
      puts '2.Создать поезд'
      puts '3.Создать маршрут и управлять станциями в нём (добавлять, удалять)'
      puts '4.Назначить маршрут поезду'
      puts '5.Создать вагон'
      puts '6.Добавить вагоны к поезду'
      puts '7.Отцепить вагоны от поезда'
      puts '8.Переместить поезд по маршруту'
      puts '9.Просмотреть список станций и список поездов на станции'
      puts '0.Выйти из меню'

      selection = gets.to_i

      case selection
      when 1
        new_station
      when 2
        new_train
      when 3
        new_route
      when 4
        set_train_route
      when 5
        new_carriage
      when 6
        add_carriage_train
      when 7
        remove_carriage_train
      when 8
        move_train
      when 9
        list_stations_and_trains
      when 0
        break
      else
        puts 'Нужно ввести число от 0 до 9 для выбора пункта меню'
      end
    end
  end

  protected
  
  def find_station_name(station_name)
    @stations.each do |station|
      return station if station.station_name == station_name
    end
  end

  def find_station_number(station_number)
    @stations[station_number.to_i - 1]
  end

  def find_route_number(number)
    @routes[number.to_i - 1]
  end

  def find_train(train_number, type)
    trains = @trains.select { |train| train.class == type }
    trains.each do |train|
      return train if train.number == train_number
    end
    nil
  end

  def find_carriage(carriage_number, type)
    carriages = @carriages.select { |carriage| carriage.class == type }
    carriages.each do |carriage|
      return carriage if carriage.number == carriage_number
    end
    nil
  end

  def find_train_carriage_number(train, carriage_number)
    train.carriages.each do |carriage|
      return carriage if carriage.number == carriage_number
    end
    nil
  end

  def show_stations
    puts 'Список станций:'
    @stations.each.with_index(1) do |station, index|
      puts "#{index}: #{station.station_name}"
    end
  end

  def show_routes
    puts 'Список маршрутов: '
    @routes.each.with_index(1) do |route, index|
      puts "#{index}: #{route.stations.first.station_name} - #{route.stations.last.station_name}"
    end
  end

  def show_trains(type)
    if type == PassengerTrain
      puts 'Список пассажирских поездов:'
    elsif type == CargoTrain
      puts 'Список грузовых поездов:'
    end

    trains = @trains.select { |train| train.class == type }

    trains.each do |train|
      puts train.number
    end
  end

  def show_carriages(type)
    if type == PassengerCarriage
      puts 'Список пассажирских вагонов:'
    elsif type == CargoCarriage
      puts 'Список грузовых вагонов:'
    end

    carriages = @carriages.select { |carriage| carriage.class == type }

    carriages.each do |carriage|
      puts carriage.number
    end
  end

  def show_train_carriages(train)
    puts "Список вагонов поезда #{train.number}:"
    train.carriages.each do |carriage|
      puts carriage.number
    end
  end

  def new_station
    puts 'Введите название станции:'
    station_name = gets.strip
    station = Station.new(station_name)
    @stations.push(station)
    puts "Станция #{station_name} создана"
  end

  def new_train
    puts 'Введите 1 для создания пассажирского поезда или 2 для грузового'
    train_type = gets.to_i

    puts 'Введите номер поезда'
    train_number = gets.to_i

    if train_type == 1
      train = PassengerTrain.new(train_number)
    elsif train_type == 2
      train = CargoTrain.new(train_number)
    end
    @trains.push(train)

    if train
      print train_type == 1 ? 'Пассажирский ' : 'Грузовой '
      puts "поезд номер #{train_number} создан"
    end
  end

  def new_route
    puts 'Выберите действие: 1 - создать маршрут, 2 - добавить станцию в маршрут, 3 - удалить станцию из маршрута'
    input = gets.to_i
    case input
    when 1
      show_stations
      puts 'Введите номер первой станции:'
      first_station_number = gets.strip
      first_station = find_station_number(first_station_number)

      puts 'Введите номер последней станции:'
      last_station_number = gets.strip
      last_station = find_station_number(last_station_number)

      route = Route.new(first_station, last_station)
      @routes.push(route)
      puts "Маршрут #{route.stations.first.station_name} - #{route.stations.last.station_name} создан"
    when 2
      show_routes
      puts 'Введите номер маршрута'
      route_number = gets.strip
      route = find_route_number(route_number)

      show_stations

      puts 'Введите номер добавляемой станции:'
      station_number = gets.strip
      station = find_station_number(station_number)

      route.add_middle_station(station)
      puts "В маршрут #{route.stations.first.station_name} - #{route.stations.last.station_name} добавлена станция #{station.station_name}"
    when 3
      show_routes
      puts 'Введите номер маршрута:'
      route_number = gets.strip
      route = find_route_number(route_number)

      show_stations

      puts 'Введите номер удаляемой станции:'
      station_number = gets.strip
      station = find_station_number(station_number)

      route.delete_middle_station(station)
      puts "Из маршрута #{route.stations.first.station_name} - #{route.stations.last.station_name} удалена станция #{station.station_name}"
    end
  end

  def set_train_route
    puts 'Введите 1 чтобы назначить маршрут пассажирскому поезду, 2 - грузовому'
    input = gets.strip

    if input == '1'
      show_trains(PassengerTrain)
    elsif input == '2'
      show_trains(CargoTrain)
    else
      puts 'Неверный ввод, маршрут не назначен'
      return
    end

    puts 'Введите номер поезда:'
    train_number = gets.to_i

    train_type = nil
    if input == '1'
      train_type = PassengerTrain
    elsif input == '2'
      train_type = CargoTrain
    end

    train = find_train(train_number, train_type)

    if !train
      puts 'Поезд с этим номером не найден'
      return
    end

    show_routes
    puts 'Введите номер маршрута:'
    route_number = gets.strip
    route = find_route_number(route_number)

    if route.nil?
      puts "Маршрута с номером #{route_number} нет"
    else
      train.set_route(route)
      puts "Поезду #{train_number} установлен маршрут #{route.stations.first.station_name} - #{route.stations.last.station_name} "
    end
  end

  def new_carriage
    puts 'Введите 1 для создания пассажирского вагона, 2 - грузового'
    input = gets.strip

    puts 'Введите номер вагона:'
    carriage_number = gets.to_i

    if input == '1'
      carriage = PassengerCarriage.new(carriage_number)
      @carriages.push(carriage)
    elsif input == '2'
      carriage = CargoCarriage.new(carriage_number)
      @carriages.push(carriage)
    else
      puts 'Выбор неверный, вагон не создан'
    end

    if carriage
      print input == '1' ? 'Пассажирский ' : 'Грузовой '
      puts "вагон номер #{carriage_number} создан"
    end
  end

  def add_carriage_train
    puts 'Введите 1 для добавления вагона к пассажирскому поезду, 2 - грузовому:'
    input = gets.strip

    if input == '1'
      show_trains(PassengerTrain)
    elsif input == '2'
      show_trains(CargoTrain)
    else
      puts 'Выбор неверный, добавления не произошло'
      return
    end

    puts 'Введите номер поезда:'
    train_number = gets.to_i

    if input == '1'
      train = find_train(train_number, PassengerTrain)
    elsif input == '2'
      train = find_train(train_number, CargoTrain)
    end

    return if !train

    if input == '1'
      show_carriages(PassengerCarriage)
    elsif input == '2'
      show_carriages(CargoCarriage)
    else
      puts 'Выбор неверный, добавления не произошло'
      return
    end

    puts 'Введите номер вагона:'
    carriage_number = gets.to_i
    if input == '1'
      carriage = find_carriage(carriage_number, PassengerCarriage)
    elsif input == '2'
      carriage = find_carriage(carriage_number, CargoCarriage)
    end

    if carriage
      train.add_carriages(carriage)
      puts "Поезду #{train.number} был добавлен вагон #{carriage.number}"
    else
      puts "Поезду #{train.number} не был добавлен вагон #{carriage_number}"
    end
  end

  def remove_carriage_train
    puts 'Введите 1 для отцепления вагона от пассажирского поезда, 2 - от грузового:'
    input = gets.strip

    if input == '1'
      show_trains(PassengerTrain)
    elsif input == '2'
      show_trains(CargoTrain)
    else
      puts 'Выбор неверный, отцепления вагона не произошло'
      return
    end

    puts 'Введите номер поезда:'
    train_number = gets.to_i

    if input == '1'
      train = find_train(train_number, PassengerTrain)
    elsif input == '2'
      train = find_train(train_number, CargoTrain)
    end

    return if !train

    show_train_carriages(train)

    puts 'Введите номер вагона:'
    carriage_number = gets.to_i
    carriage = find_train_carriage_number(train, carriage_number)

    if carriage
      train.delete_carriages(carriage)
      puts "От поезда #{train.number} был отцеплен вагон #{carriage.number}"
    else
      puts "От поезда #{train.number} не был отцеплен вагон #{carriage_number}"
    end
  end

  def move_train
    puts 'Введите 1 для перемещения пассажирского поезда, 2 - грузового:'
    input = gets.strip

    if input == '1'
      show_trains(PassengerTrain)
    elsif input == '2'
      show_trains(CargoTrain)
    else
      puts 'Выбор неверный, отцепления вагона не произошло'
      return
    end

    puts 'Введите номер поезда:'
    train_number = gets.to_i

    if input == '1'
      train = find_train(train_number, PassengerTrain)
    elsif input == '2'
      train = find_train(train_number, CargoTrain)
    end

    return if !train

    puts 'Введите 1 для перемещения поезда вперёд по маршруту, 2 - назад:'
    input = gets.strip

    if input == '1'
      train.move_next_station
      puts "Поезд был перемещен вперёд на станцию #{train.current_station.station_name}"
    elsif input == '2'
      train.move_previous_station
      puts "Поезд был перемещен назад на станцию #{train.current_station.station_name}"
    else
      puts 'Выбор неверный, перемещения не произошло'
      return
    end
  end

  def list_stations_and_trains
    puts 'Список станций и поездов: '
    @stations.each.with_index(1) do |station, index|
      puts "#{index}: #{station.station_name}"
      trains = station.trains_list_type
      trains.each.with_index(1) do |train, index_train|
        puts " #{index_train}: Поезд номер #{train.number}"
      end
    end
  end
end
