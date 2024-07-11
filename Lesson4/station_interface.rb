require "./menu.rb"
require "./type_train.rb"
require "./route.rb"
require "./train.rb"
require "./station.rb"
require "./station_interface.rb"
require "./train_interface.rb"
require "./main_interface.rb"

class StationInterface
  def initialize
    @menu = { "1": ["Создание станции", "create_station"],
              "2": ["Выбор станции", "change_station"],
              "3": ["Отправка поезда", "out_train"],
              "4": ["Табло прибытия", "show_train"],
              "5": ["Список поездов по типу", "show_type_train"],
              "99": ["Основное меню", "interface_main"] }
  end

  def run
    puts "Управление станцией #{$station.name}" if !$station.nil?
    menu_show(@menu)
  end

  private

  def control_station
  end

  def create_station
    puts "Введите название станции"
    name = gets.chomp.to_str.upcase
    $stations << Station.new(name)
    print_text("Создана станция", name)
    $station = $stations[-1]
    interface_station
  end

  def change_station
    $station = change($stations, "станции", $station)
    interface_station
  end

  def out_train
    if !$station.nil?
      train = change($station.list_trains, "поезд") if !$station.list_trains.nil?
      if !train.nil?
        train.next
        print_text("С станции отправился поезд номер #{train.name}")
      else
        print_text("На станции нет поезда для отправки")
      end
    end
    interface_station
  end

  def show_train
    if !$station.nil?
      if !$station.list_trains.empty?
        show_array($station.list_trains, "На станцию прибыли поезда")
      else
        print_text("На станции нет поездов")
      end
    end
    interface_station
  end

  def show_type_train
    if !$station.nil?
      # && !$station.list_type_trains.nil?
      show_array($station.list_type_trains[0],
                 "На станцию прибыли пассажирские поезда") if !$station.list_type_trains[0].nil?
      show_array($station.list_type_trains[1],
                 "На станцию прибыли грузовые поезда") if !$station.list_type_trains[1].nil?
    end
    interface_station
  end
end
