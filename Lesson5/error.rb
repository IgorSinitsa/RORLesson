# frozen_string_literal: true

class RzdError < StandardError
end

class CarrigeError < StandardError
end
class ValidateError < StandardError
 err0 = ValidateError.new('Название не может быть пустым ')
 err1 = ValidateError.new('Не тот тип переменной')
 err2 = ValidateError.new('Не соответствует формату ')

end
