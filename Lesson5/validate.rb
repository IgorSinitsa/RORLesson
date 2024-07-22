module Validate
  require "./error.rb"

  def valid?(name, obj)
    validate!(name, obj)
    true
  rescue
    false
  end

  def validate!(name, obj)
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
end
