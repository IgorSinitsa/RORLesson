# Маршруты поезда
# Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута,
# а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
  attr_reader :list, :first, :last, :alllist

  def initialize(name, first, last)
    @name = name
    @first = first
    @last = last
    @list = []
    @alllist = []
  end

  def addstation(name)
    @list << name
    createalllist
  end

  # Вводим порядковый номер промежуточной станции для удаления
  def delstation(number)
    @list.delete_at(number - 1)
    createalllist
  end

  def createalllist
    @alllist = @list
    @alllist.insert(0, @first)
    @alllist.insert(-1, @last)
  end
end
