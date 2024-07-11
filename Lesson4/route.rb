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

  def add_station(obj)
    @list << obj if !@list.include?(obj)
    create_all_list
  end

  # Вводим порядковый номер промежуточной станции для удаления
  def delete_station(obj)
    @list.delete(obj) if @list.include?(obj)
    create_all_list
  end

  private

  def create_all_list
    @all_list = [@first]
    @all_list.concat(@list) if !@list.empty?
    @all_list << @last
  end
end
