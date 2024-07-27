# frozen_string_literal: true

require "./instance_counter"
require "./manufacturer"
require_relative "error"
require_relative "validate"
require "./menu"
require "./modules"
require "./station"
require "./train"
require_relative "cargo_train"
require_relative "passenger_train"
require_relative "carriage"
require_relative "cargo_carriage"
require_relative "passenger_carriage"
require_relative "route"

Station.new("Бологое")
Station.new("Москва")
Station.new("Санкт-Петербург")
Station.new("Пенза")
Station.new("Саратов")
CargoTrain.new("123-56")
CargoTrain.new("123-AA")
CargoTrain.new("555BI")
CargoTrain.new("123AA")
PassengerTrain.new("234-FA")
PassengerTrain.new("666AD")
PassengerTrain.new("909-09")

menu = { "1": ["Создание станции", "create_station"],
         "2": ["Выбор станции", "change_station"],
         "3": ["Отправка поезда", "out_train"],
         "4": ["Табло прибытия", "show_train"],
         "5": ["Список поездов по типу", "show_type_train"],
         "99": ["Основное меню", "interface_main"] }

menu1 = { "1": ["Создание поезда", "create_train"],
          "2": ["Выбор поезда", "change_train"],
          "3": ["Назначение маршрута", "change_route_train"],
          "4": ["Движение поезда вперед", "forward_train"],
          "5": ["Движение поезда назад", "back_train"],
          "6": ["Прицепить вагон", "carriage_attach"],
          "7": ["Отцепить вагон", "carriage_unhook"],
          "8": ["Набрать скорость", "speed_up"],
          "9": %w[Остановиться speed_stop],
          "10": ["Информационное табло", "information_table"],
          "11": ["Заполнить вагон", "fill_carriage"],
          "99": ["Основное меню", "interface_main"] }

menu2 = { "1": ["Создание маршрута", "create_route"],
          "2": ["Выбор маршрута", "change_route"],
          "3": ["Добавить промежуточную станцию", "add_station_route"],
          "4": ["Удалить промежуточную станцию", "delete_station_route"],
          "5": ["Показать маршрут", "show_route"],
          "99": ["Основное меню", "interface_main"] }
Station.load_menu(menu)
Train.load_menu(menu1)
Route.load_menu(menu2)

Route.interface_main
