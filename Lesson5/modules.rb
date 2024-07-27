module Misc
  include Validate

  def question(text)
    puts "Введите название #{text}"
    gets.chomp
  end

  def number_of(text)
    puts "#{text}"
    gets.chomp
  end

  def to_key(str)
    str.to_s.to_sym.downcase
  end

  def info_carriages(train)
    if !train.carriages.empty?
      text = train.instance_of?(CargoTrain) ? 'объем' : 'мест'
      train.carriages.each_value do |carriage|
        puts "Номер вагона #{carriage.name} #{text}: #{carriage.total} - занято #{carriage.count}"
      end
    else
      puts 'вагоны не прицеплены'
    end
  end

  def number_train(train)
    print "№ #{train.name} "
    if train.station.nil?
      puts 'в ожидании маршрута'
    else
      puts " #{train.full_route[0].name} - #{train.full_route[-1].name}"
    end
  end

  def info_train(text1, text2 = nil, text3 = nil)
    puts "Предыдущая станция машрута #{name_from_obj(text3)}" unless name_from_obj(text3).empty?

    if text1.nil?
      puts 'В ожидании назначении маршрута'
    else
      puts "Прибыл на станцию  #{name_from_obj(text1)}"
    end

    puts "Следущая станция  маршрута #{name_from_obj(text2)}" unless name_from_obj(text2).empty?
  end

  def name_from_obj(obj)
    if obj.nil?
      ''
    else
      obj.name
    end
  end
end
