# Разбить программу на отдельные классы (каждый класс в отдельном файле)
# Разделить поезда на два типа PassengerTrain и CargoTrain, сделать родителя для классов, который будет содержать общие методы и свойства
# Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию. В комментарии к методу обосновать, почему он был вынесен в private/protected
# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые.
# При добавлении вагона к поезду, объект вагона должен передаваться как аргумент метода и сохраняться во внутреннем массиве поезда, в отличие от предыдущего задания, где мы считали только кол-во вагонов. Параметр конструктора "кол-во вагонов" при этом можно удалить.

# Добавить текстовый интерфейс:

# Создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
#      - Создавать станции
#      - Создавать поезда
#      - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
#      - Назначать маршрут поезду
#      - Добавлять вагоны к поезду
#      - Отцеплять вагоны от поезда
#      - Перемещать поезд по маршруту вперед и назад
#      - Просматривать список станций и список поездов на станции

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

$station_interface = StationInterface.new
$train_interface = TrainInterface.new
$interface = MainInterface.new
$route_interface = RouteInterface.new
$stations = []
$station = nil
$trains = []
$train = nil
$routes = []
$route = nil
#  управление интерфейсами
def interface_main
  $interface.run
end

def interface_station
  $station_interface.run
end

def interface_train
  $train_interface.run
end

def interface_route
  $route_interface.run
end

def stop_prog
  abort "Спасибо за игру"
end

# # тестовый блок
# $stations << Station.new("111111")
# $stations <<  Station.new("222222")
# $stations <<  Station.new("33333")
# $stations <<  Station.new("44444")
# $stations <<  Station.new("555555")

menu_clear
interface_main
