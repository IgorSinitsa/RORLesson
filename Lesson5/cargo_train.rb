class CargoTrain < Train
  def initialize(name)
    super
    self.class.superclass.list_obj[name.to_s.to_sym] = self
    self.class.superclass.obj = self
  end

  def attach_carriage
    name = question("вагона")
    total = number_of("Какой обьем вагона").to_f
    CargoCarriage.new(name, total, self)
  rescue CarrigeError => e
    puts e
    retry
  end
end
