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
              "3": ["Добавить промежуточную станцию", "add_route"],
              "4": ["Удалить промежуточную станцию", "delete_route"],
              "5": ["Показать маршрут", "show_route"],
              "99": ["Основное меню", "interface_main"] }
  end

  def run
    puts "Управление маршрутом #{$routes[$route].name}" if $route != nil
    menu_show(@menu)
  end

  private

  def create_route
    print_text("Готовы выбрать начальную станцию?", "")
    first_station = menu_change(array_name($stations))
    print_text("Готовы выбрать конечную станцию?", "")
    last_station = menu_change(array_name($stations))
    puts "Введите название маршрута"
    name = gets.chomp.to_str.upcase
    route = Route.new(name, $stations[first_station], $stations[last_station])
    $routes << route
    interface_route
  end

  def change_route
    $route = menu_change(array_name($routes))
    interface_route
  end

  def add_route
    if $route != nil
      station = menu_change(array_name($stations))
      $routes[$route].add_station($stations[station])
      print_text("Добавлена станция", $stations[station].name)
    end
    interface_route
  end

  def delete_route
    if $route != nil
      i = menu_change(array_name($routes[$route].list))
      station = $routes[$route].list[i].name
      $routes[$route].delete_station(i)
      print_text("Удалена станция", station)
    end
    interface_route
  end

  def show_route
    show_array($routes[$route].all_list, "Маршрут", $routes[$route].name)
    interface_route
  end
end
