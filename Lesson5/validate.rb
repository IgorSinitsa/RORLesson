module Validate
  require "./error"

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def validate!(*args)
    name = self.name
    obj = args[0] || self

    raise RzdError, "Название не может быть пустым " if name.empty?

    if obj.instance_of?(Station)
      raise RzdError, "Название #{name} больше, чем 20 символов " if name.length > 20
    elsif obj.instance_of?(Route)
      raise RzdError, "Название #{name} больше, чем 10 символов " if name.length > 10
    elsif obj.is_a?(Train)
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
