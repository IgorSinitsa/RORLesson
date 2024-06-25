# Управление станцией
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :name, :list_train, :list_type

  def initialize(name)
    @name = name
    @list_train = []
    @list_type_train = {}
    # self.listtype_train.default = [0, []] плохо работает с массивами по умолчанию(
  end

  # прием отправка поездов
  def in(train)
    in_train(train) if @list_train.include(train).nil?
  end

  def out(train)
    out_train(train) if @list_train.include(train) != nil
  end

  # обработка списков типов поездов
  def in_train(train)
    @listtrain << train
    if @list_type[train.type_train].nil?
      t = [0, []]
    else
      t = @list_type[train.type_train]
    end

    t[0] += 1
    t[1] << train
    @list_type[train.type_train] = t
  end

  def out_train(train)
    @listtrain.delete(train)
    t = @list_type[train.type_train]

    t[0] -= 1
    t[1].delete(train)
    @list_type[train.type_train] = t
  end
end
