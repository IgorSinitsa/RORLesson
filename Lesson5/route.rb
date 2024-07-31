class Route
  include InstanceCounter
  include Menu
  include Validation
  ROUTE_EMPTY_EXIT = false
  class << self
    def create_route
      if Station.count > 1
        name = question("маршрут")
        if !(name.empty? and ROUTE_EMPTY_EXIT)
          puts "Начало маршрута"
          first_station = change(Station.all)
          puts "Конец маршрута"
          last_station = change(Station.all)
          Route.new(name, first_station, last_station)
        end
        run
      end

    rescue RzdError => e
      puts e
      retry
    end

    def change_route
      @obj = change(@list_obj) if list_obj.count > 0
      run
    end

    def add_station_route
      if !@obj.nil?
        puts "Добавьте станцию"
        @obj.add_station(change(Station.all))
      end
      run
    end

    def delete_station_route
      if !@obj.nil?
        if !@obj.list.empty?
          @obj.delete_station(change_array(@obj.list))
        end
      end
      run
    end

    def show_route
      puts "Маршрут поезда"
      @obj.all_list.each { |obj| puts obj.name } if !@obj.nil?
      run
    end
  end
  # ------------------------------------------------------------------------------------------------
  attr_reader :name, :list, :all_list
  validate :name, :presence
  validate :name, :type, String
  validate :name, :length, 10

  def initialize(name, first, last)
    super
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
