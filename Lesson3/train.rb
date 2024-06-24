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
class Train
  attr_reader :name, :numberofcarriage, :speed, :instation, :outstation, :fullroute
  attr_reader :prevstation, :nextstation, :station, :typetrain

  def initialize(name, typetrain, speed = nil, number = nil)
    @name = name
    @fullroute = []
    @speed = 0
    @number_station = 0
    @maxspeed = speed
    @numberofcarriage = number
    @typetrain = typetrain.name
    @numberofcarriage = typetrain.numberofcarriage if number.nil?

    @maxspeed = typetrain.speed if speed.nil?
  end

  # Управление скоростью
  def upspeed
    @speed = @maxspeed
  end

  def stop
    @speed = 0
  end

  # Прицеп и отцеп вагонов
  def incarriage
    @numberofcarriage += 1 if @speed == 0
  end

  def outcarriage
    @numberofcarriage -= 1 if @numberofcarriage > 0 && @speed == 0
  end

  # загрузка маршрута
  def loadroute(route)
    @fullroute = route.alllist
    @instation = route.first
    @outstation = route.last

    tablotrain(0)
  end

  # Движение поезда вперед назад
  def prev
    @number_station -= 1 if @number_station > 0
    tablotrain(@number_station)
  end

  def next
    @number_station += 1 if @number_station > self.fullroute.length - 1
    tablotrain(@number_station)
  end

  # табло предудющая текущая и следующая станция
  def tablotrain(number)
    @station = self.fullroute[number]
    if number > 0
      @prevstation = self.fullroute[number - 1]
    else
      @prevstation = ""
    end
    if @number < (self.fullroute.length -1)
      @nextstation = self.fullroute[number + 1]
    else
      @nextstation = ""
    end
  end
end
