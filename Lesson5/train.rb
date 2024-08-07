class Train
  include InstanceCounter
  include Menu
  include Misc
  include Manufacturer
  include Validation
  FORMAT_NUMBER_TRAIN = /^[a-z\d]{3}-?[a-z\d]{2}$/i
  TRAIN_EMPTY_EXIT = false
  class << self
    def find(number) # поиск поезда по номеру
      @list_obj[to_key number]
    end

    def create_train
      create_passenger = lambda { |name| PassengerTrain.new(name) }
      create_cargo = lambda { |name| CargoTrain.new(name) }
      name = question("номер поезда")
      if !(name.empty? and TRAIN_EMPTY_EXIT)
        menu = { "0": ["Грузовой", create_cargo],
                 "1": ["Пасажирский", create_passenger] }
        func = menu_change(menu)
        func.call(name)
      end
      run
    rescue RzdError => e
      puts e
      retry
    end

    def change_train
      @obj = change(@list_obj) if list_obj.count > 0
      run
    end

    def change_route_train
      if Route.count > 0
        route = change(Route.all)
        @obj.load_route(route.all_list)
      end
      run
    end

    def forward_train
      if !@obj.nil?
        @obj.next if !@obj.station.nil?
        info_train(@obj.station, @obj.next_station)
      end
      run
    end

    def back_train
      if !@obj.nil?
        @obj.prev if !@obj.station.nil?
        info_train(@obj.station, @obj.next_station)
      end
      run
    end

    def carriage_attach
      if !@obj.nil?
        @obj.attach_carriage
        puts "Всего вагонов #{@obj.carriages.count}"
      end

      run
    end

    def carriage_unhook
      if !@obj.nil?
        # carriage = Menu::change(@carriages)
        @obj.unhook_carriage(change(@obj.carriages).name)
        puts "Всего вагонов #{@obj.carriages.count}"
      end
      run
    end

    def speed_up
      if !@obj.nil?
        speed = question("скорость")
        @obj.speed_up(speed.to_i)
        puts "Текущая скорость поезда #{@obj.speed}"
      end
      run
    end

    def speed_stop
      if !@obj.nil?
        @obj.speed_stop
        puts "Текущая скорость поезда #{@obj.speed}"
      end
      run
    end

    def information_table
      unless @obj.nil?
        info_train(@obj.station, @obj.next_station, @obj.prev_station)
        info_carriages(@obj)
        run
      end
    end

    def fill_carriage
      unless @obj.nil?
        unless @obj.carriages.empty?
          info_carriages(@obj)
          carriage = change(@obj.carriages)

          if carriage.free_quantity > 0
            if @obj.class == CargoTrain
              text = "обьем"
              volume = number_of("Введите количество")
              puts volume
              puts "Мало места" unless carriage.volume_in(volume.to_f)
            else
              text = "мест"
              puts "Мало места" unless carriage.passenger_in
            end
          else
            puts "Мало места"
          end
          puts "Номер вагона #{carriage.name} #{text}: #{carriage.total} - занято #{carriage.count}"
        else
          puts "вагонов нет"
        end
      else
        puts "вагонов нет"
      end
      run
    end
  end
  # ------------------------------------------------------------------------------------------------
  attr_reader :name, :carriages, :speed, :full_route
  attr_reader :prev_station, :next_station, :station
  validate :name, :presence
  validate :name, :format, /^[a-z\d]{3}-?[a-z\d]{2}$/i
  validate :name, :type, String

  def initialize(name, speed = 80, carriages = {})
    @name = name
    @full_route = []
    @speed = 0
    @number_station = 0
    @maxspeed = speed
    @carriages = carriages
    super
    register_instance
  end

  # Управление скоростью
  def up_speed(speed)
    @speed = speed if @speed < @maxspeed && @speed > 0
  end

  def stop
    @speed = 0
  end

  # Прицеп и отцеп вагонов

  def unhook_carriage(name)
    @carriages.delete(to_key name)
  end

  # загрузка маршрута
  def load_route(route)
    @full_route = route
    route_train(0)
  end

  # Движение поезда вперед назад
  def prev
    if @number_station > 0
      @station.out(self)
      @number_station -= 1
      route_train(@number_station)
    end
  end

  def next
    if @number_station < @full_route.length
      @station.out(self)
      @number_station += 1
      route_train(@number_station)
    end
  end

  protected

  # табло предудющая текущая и следующая станция
  def route_train(number)
    @station = @full_route[number]

    @station.in(self)
    if number > 0
      @prev_station = @full_route[number - 1]
    else
      @prev_station = nil
    end
    if number < (@full_route.length - 1)
      @next_station = @full_route[number + 1]
    else
      @next_station = nil
    end
  end
end
