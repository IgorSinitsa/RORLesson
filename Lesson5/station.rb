class Station
  include InstanceCounter
  include Menu
  class << self
    def create_station
      name = question("станции")

      if !name.empty?
        Station.new(name)
      end
    rescue TrainError => e
      puts e
    ensure
      run
    end

    def change_station
      @obj = change(@list_obj) if list_obj.count > 0
      run
    end

    def out_train
      if !@obj.list_trains.empty?
        list_train = @obj.list_trains
        out_train = change(list_train)
        puts "С платформы 7 отправился поезд № #{out_train.name} #{out_train.full_route[0].name} - #{out_train.full_route[-1].name}"
        obj.next
      end
      run
    end

    def show_train
      if !@obj.nil?
        if !@obj.list_trains.empty?
          puts "На станцию прибыли поезда"
          @obj.list_trains.each { |obj| puts "№ #{obj.name} #{obj.full_route[0].name} - #{obj.full_route[-1].name}" }
        else
          puts "На станции нет поездов"
        end
      end
      run
    end

    def show_type_train
      if !@obj.nil?
        if !@obj.list_trains.empty?
          puts "На станцию прибыли поезда"
          if !@obj.list_type_trains[0].nil?
            puts "Грузовые"
            @obj.list_type_trains[0].each { |obj|
              puts "№ #{obj.name} #{obj.full_route[0].name} - #{obj.full_route[-1].name}"
            }
          end
          if !@obj.list_type_trains[1].nil?
            puts "Пассажирские"
            @obj.list_type_trains[1].each { |obj|
              puts "№ #{obj.name} #{obj.full_route[0].name} - #{obj.full_route[-1].name}"
            }
          end
        else
          puts "На станции нет поездов"
        end
      end
      run
    end
  end
  attr_reader :name, :list_trains, :list_type_trains

  def initialize(name)
    super
    @name = name
    @list_trains = []
    @list_type_trains = {}
    register_instance
  end

  # прием отправка поездов
  def in(train)
    in_train(train) if !@list_trains.include?(train)
  end

  def out(train)
    out_train(train) if @list_trains.include?(train)
  end

  private

  # обработка списков типов поездов
  def in_train(train)
    @list_trains << train

    i = 0 if train.class == CargoTrain
    i = 1 if train.class == PassengerTrain
    type = list_type_trains.fetch(i, [])
    type << train
    list_type_trains[i] = type
  end

  def out_train(train)
    @list_trains.delete(train)
    i = 0 if train.class == CargoTrain
    i = 1 if train.class == PassengerTrain
    type = list_type_trains.fetch(i, [])
    type.delete(train) if !type.empty?
    list_type_trains[i] = type
  end
end
