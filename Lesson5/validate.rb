module Validate
require "./error.rb"
  def valid?(name, obj)
    validate!(name, obj)
    true
  rescue
    false
  end

  def validate!(name, obj)
    raise TrainError, "Название не может быть пустым " if name.length > 20
    raise TrainError, "Название #{name} больше, чем 20 символов " if name.length > 20
    raise TrainError, "Такое название #{name} уже используется " if obj.class.list_obj.key?to_key(name)
    raise TrainError ,"Номер поезда #{name} не соответствует формату XXX-XX " if ((name !~ Train::FORMAT_NUMBER_TRAIN) &&
                                                                     (obj.class.name.to_s.include?("Train")))
  end
end
