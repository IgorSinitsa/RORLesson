# Управление станцией
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :name, :list_trains, :list_type_trains

  def initialize(name)
    @name = name
    @list_trains = []
    @list_type_trains = {}
  end

  # прием отправка поездов
  def in(train)
    puts train
    gets
    in_train(train) if !@list_trains.include?(train)
  end

  def out(train)
    out_train(train) if @list_trains.include?(train)
  end

  private

  # обработка списков типов поездов
  def in_train(train)
    @list_trains << train
    # i = 0 if train.is_a? PassengerTrain
    # i = 1 if train.is_a? CargoTrain
    i = 0 if train.class == PassengerTrain
    i = 1 if train.class == CargoTrain
    type = list_type_trains.fetch(i, [])
    type << train
    list_type_trains[i] = type
  end

  def out_train(train)
    @list_train.delete(train)
    i = 0 if train.class == PassengerTrain
    i = 1 if train.class == CargoTrain
    type = list_type_trains.fetch(i, [])
    type.delete(train) if !type.empty?
    list_type_trains[i] = type
  end
end
