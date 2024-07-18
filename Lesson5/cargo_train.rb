# require_relative 'train'
# require_relative 'station'

class CargoTrain < Train

  def initialize(name)
    super
    self.class.superclass.list_obj[name.to_s.to_sym] = self
    self.class.superclass.obj = self
  end

  def attach_carriage
    carriage = CargoCarriage.new
    @carriages << carriage
  end
end
