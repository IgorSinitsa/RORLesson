# Маршруты поезда
# Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута,
# а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
  attr_reader :name, :list, :all_list

  def initialize(name, first, last)
    @name = name
    @first = first
    @last = last
    @list = []
    @all_list = []
    create_all_list
  end

  def add_station(name)
    @list << name
    create_all_list
  end

  # Вводим порядковый номер промежуточной станции для удаления
  def delete_station(number)
    @list.delete_at(number - 1)
    create_all_list
  end
private
  def create_all_list
    @all_list = @list
    @all_list << @last
    @all_list.unshift(@first)

  end
end
