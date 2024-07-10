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
    puts "Управление поездом номер #{$train.name}" if !$train.nil?
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
    $train = train
    print_text("Создан поезд номер", name)
    interface_train
  end

  def change_train
    $train = change($trains, "поезд", $train)
    interface_train
  end

  def change_route_train
    route = change($routes, "маршрут", $route)
    $train.load_route(route) if !route.nil?
    interface_train
  end

  def forward_train
    if !$train.nil?
      $train.next if !$train.next_station.nil?
      print_text("Поезд номер #{$train.name} прибыл на станцию #{$train.station.name}  ", "")
    end
    interface_train
  end

  def back_train
    if !$train.nil?
      $trains[train].prev if !$train.prev_station.nil?
      print_text("Поезд номер #{$train.name} прибыл на станцию #{$train.station.name}  ", "")
    end
    interface_train
  end

  def carriage_attach
    if !$train.nil?
      $train.attach_carriage
      print_text("Вагон прицеплен")
    end
    interface_train
  end

  def carriage_unhook
    if !$train.nil?
      if !$train.carriages.empty?
        $train.unhook_carriage
        print_text("Вагон отцеплен")
      end
    end
    interface_train
  end

  def speed_up
    if !$train.nil?
      puts "Ведите скорость поезда"
      speed = gets.chomp.to_i
      $train.up_speed(speed)
      print_text("Скорость поезда #{$train.speed}")
    end
    interface_train
  end

  def speed_stop
    if !$train.nil?
      $train.stop
      print_text("Поезд остановлен")
    end
    interface_train
  end
end
