class PassengerTrain < Train
  def initialize(name)
    super
    self.class.superclass.list_obj[name.to_s.to_sym] = self
    self.class.superclass.obj = self
  end

  def attach_carriage
    name = question("вагона")
    total = number_of("Сколько пассажиров вмещает").to_i
    PassengerCarriage.new(name, total, self)

  rescue CarrigeError => e
    puts e
    retry
  end
end
