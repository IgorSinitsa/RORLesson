module Validate
  require "./error.rb"

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!(*args)
    name = self.name
    if args[0].nil?
      obj = self
    else
      obj = args[0]
    end

    raise RzdError, "Название не может быть пустым " if name.empty?

    if obj.class == Station
      raise RzdError, "Название #{name} больше, чем 20 символов " if name.length > 20
    elsif obj.class == Route
      raise RzdError, "Название #{name} больше, чем 10 символов " if name.length > 10
    elsif obj.class.superclass == Train
      raise RzdError, "Номер поезда #{name} не соответствует формату XXX-XX " if name !~ Train::FORMAT_NUMBER_TRAIN
    end
    raise RzdError, "Такое название #{name} уже используется " if obj.class.list_obj.key? to_key(name)
  end

  def validate_carriage!(obj, obj1)
    name = obj.name
    total = obj.total

    raise CarrigeError, "Название не может быть пустым " if name.empty?
    raise CarrigeError, "Число не может быть нулевым или отрицательным" if total <= 0
    raise CarrigeError, "Такое название #{name} уже используется " if obj1.carriages.key? to_key(name)
  end
end
