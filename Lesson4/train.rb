# Управление поездом
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов,
# эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает
# или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад,
# но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
require "./type_train.rb"

class Train
  attr_reader :name, :carriages, :speed, :full_route
  attr_reader :prev_station, :next_station, :station

  def initialize(name, speed = 40, carriages = [])
    @name = name
    @full_route = []
    @speed = 0
    @number_station = 0
    @maxspeed = speed
    @carriages = carriages
  end

  # Управление скоростью
  def up_speed(speed)
    @speed = speed if @speed < @maxspeed && @speed > 0
  end

  def stop
    @speed = 0
  end

  # Прицеп и отцеп вагонов

  def unhook_carriage
    @carriages.delete_at(-1)
  end

  # загрузка маршрута
  def load_route(route)
    @full_route = route
    route_train(0)
  end

  # Движение поезда вперед назад
  def prev
    if @number_station > 0
      @station.out(self)
      @number_station -= 1
      route_train(@number_station)
    end
  end

  def next
    if @number_station > @full_route.length - 1
      @station.out(self)
      @number_station += 1
      route_train(@number_station)
    end
  end

  private

  # табло предудющая текущая и следующая станция
  def route_train(number)
    @station = @fullroute[number]
    @station.in(self)
    if number > 0
      @prev_station = @fullroute[number - 1]
    else
      @prev_station = ""
    end
    if @number < (@fullroute.length - 1)
      @next_station = @fullroute[number + 1]
    else
      @next_station = ""
    end
  end
end
