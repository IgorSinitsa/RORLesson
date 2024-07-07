# Заготовка под разные типы поездов

require "./train.rb"

class PassengerTrain < Train
  # def initialize(name)

  # end
  def attach_carriage
    carriage = PassengerCarriage.new
    @carriages << carriage
  end
end

class CargoTrain < Train
  # def initialize(name)

  # end
  def attach_carriage
    carriage = CargoCarriage.new
    @carriages << carriage
  end
end
