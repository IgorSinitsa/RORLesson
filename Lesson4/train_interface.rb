require "./menu.rb"
require "./type_train.rb"
require "./route.rb"
require "./train.rb"
require "./station.rb"
require "./station_interface.rb"
require "./train_interface.rb"
require "./main_interface.rb"
require "./cargo_carriage.rb"
require "./passenger_carriage.rb"
require "./route_interface.rb"
require "./type_train.rb"

class TrainInterface
  def initialize
    @menu = { "1": ["Создание поезда", "create_train"],
              "2": ["Выбор поезда", "change_train"],
              "3": ["Назначение маршрута", "change_route_train"],
              "4": ["Движение поезда вперед", "forward_train"],
              "5": ["Движение поезда назад", "back_train"],
              "6": ["Прицепить вагон", "carriage_attach"],
              "7": ["Отцепить вагон", "carriage_unhook"],
              "8": ["Набрать скорость", "speed_up"],
              "9": ["Остановиться", "speed_stop"],
              "99": ["Основное меню", "interface_main"] }
  end

  def run
    puts "Управление поездом номер #{$trains[$train].name}" if $train != nil
    menu_show(@menu)
  end
private
  def create_train
    menu = ["Грузовой", "Пассажирский"]
    i = menu_change(menu)
    puts "Введите номер поезда"
    name = gets.chomp.to_str.upcase
    if i == 0
      train = CargoTrain.new(name)
    else
      train = PassengerTrain.new(name)
    end

    $trains << train
    print_text("Создан поезд номер", name)
    interface_train
  end

  def change_train
    $train = menu_change(array_name($trains))
    interface_train
  end

  def change_route_train
    route = menu_change(array_name($routes))
    $trains[train].load_route($routes[route])
    interface_train
  end

  def forward_train
    $trains[train].next
    print_text("Поезд номер #{$trains[train].name} прибыл на станцию #{$trains[train].station.name}  ", "")

    interface_train
  end

  def back_train
    $trains[train].prev
    print_text("Поезд номер #{$trains[train].name} прибыл станцию #{$trains[train].station.name}  ", "")
    interface_train
  end

  def carriage_attach
    $trains[train].attach_carriage
    print_text("Вагон прицеплен")
    interface_train
  end

  def carriage_unhook
    $trains[train].unhook_carriage
    print_text("Вагон отцеплен")
    interface_train
  end

  def speed_up
    $trains[train].up_speed(20)
    print_text("Скорость поезда #{$trains[train].speed}")
    interface_train
  end

  def speed_stop
    $trains[train].stop
    print_text("Поезд стоит")
    interface_train
  end
end
