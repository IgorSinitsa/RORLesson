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
    puts "Управление станцией #{$stations[$station].name}" if $station != nil
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
    interface_station
  end

  def change_station
    $station = menu_change(array_name($stations))
    interface_station
  end

  def out_train
    i = menu_change(array_name($stations[$station].list_trains))
    train = $stations[$station].list_trains[i]
    train.next
    print_text("С станции отправился поезд номер #{train.name}")
    interface_station
  end

  def show_train
    show_array($stations[$station].list_trains, "На станцию прибыли поезда")
    interface_station
  end

  def show_type_train
    show_array($stations[$station].list_type_trains[0], "На станцию прибыли пассажирские поезда")
    show_array($stations[$station].list_type_trains[1], "На станцию прибыли грузовые поезда")
    interface_station
  end
end
