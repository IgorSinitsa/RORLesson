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
require "./main_interface.rb"

class MainInterface
  def initialize
    @menu = { "1": ["Управение станцией", "interface_station"],
              "4": ["Управение поездом", "interface_station"],
              "3": ["Управение маршрутом", "interface_route"],
              "2": ["Управение поездом", "interface_train"],
              "99": ["Выход", "stop_prog"] }
  end

  def run
    menu_show(@menu)
  end
end
