require "./menu.rb"
require "./type_train.rb"
require "./route.rb"
require "./train.rb"
require "./station.rb"
require "./station_interface.rb"
require "./train_interface.rb"
require "./main_interface.rb"
# require "./сargo_carriage.rb"
require "./passenger_carriage.rb"
require "./main_interface.rb"

class RouteInterface
  def initialize
    @menu = { "1": ["Создание маршрута", "create_route"],
              "2": ["Выбор маршрута", "change_route"],
              "3": ["Добавить промежуточную станцию", "add_station"],
              "4": ["Удалить промежуточную станцию", "delete_station"],
              "5": ["Показать маршрут", "show_route"],
              "99": ["Основное меню", "interface_main"] }
  end

  def run
    puts "Управление маршрутом #{$route.name}" if !$route.nil?
    menu_show(@menu)
  end

  private

  def create_route
    first_station = change($stations, "начальную станцию")
    last_station = change($stations, "конечную станцию")
    if !first_station.nil? && !last_station.nil?
      puts "Введите название маршрута"
      name = gets.chomp.to_str.upcase
      route = Route.new(name, first_station, last_station)
      $routes << route
      $route = route
    end
    interface_route
  end

  def change_route
    $route = change($routes, "маршрут")
    interface_route
  end

  def add_station
    if !$route.nil?
      station = change($stations, "станцию")
      if !station.nil?
        $route.add_station(station)
        print_text("Добавлена станция", station.name)
      end
    end
    interface_route
  end

  def delete_station
    if !$route.nil?
      if !$route.list.empty?
        station = change($route.list, "станцию")
        if !station.nil?
          $route.delete_station(station)
          print_text("Удалена станция", station.name)
        end
      end
    end
    interface_route
  end

  def show_route
    show_array($route.all_list, "Маршрут ", $route.name) if !route.nil?
    interface_route
  end
end
