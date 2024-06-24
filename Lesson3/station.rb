# Управление станцией
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :name, :listtrain, :listtypetrain

  def initialize(name)
    @name = name
    @listtrain = []
    @listtypetrain = {}
    # self.listtypetrain.default = [0, []] плохо работает с массивами по умолчанию(
  end

  # прием отправка поездов
  def in(train)
    intrain(train) if train.station == self.station.name && if self.listtrain.index(train.name) == nil
    end

    def out(train)
      outtrain(train) if self.listtrain.index(train.name) != nil
    end
  end

  # обработка списков типов поездов
  def intrain(train)
    @listtrain << train.name
    if @listtypetrain[train.typetrain].nil?
      t = [0, []]
    else
      t = @listtypetrain[train.typetrain]
    end
    puts t.inspect
    t[0] += 1
    t[1] << train.name
    @listtypetrain[train.typetrain] = t
    puts t.inspect
  end

  def outtrain(train)
    @listtrain.delete(train.name)
    t = @listtypetrain[train.typetrain]
    puts t.inspect
    t[0] -= 1
    t[1].delete(train.name)
    @listtypetrain[train.typetrain] = t
    puts t.inspect
  end
end
