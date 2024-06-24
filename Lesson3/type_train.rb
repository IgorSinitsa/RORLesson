# Определение типа поезда
# Заготовка под разные типы поездов
class TypeTrain
  attr_reader :name, :numberofcarriage, :speed

  def initialize(name, number = 1, speed = 10)
    @name = name
    @numberofcarriage = number
    @speed = speed
  end
end
