require "./menu.rb"
require "./type_train.rb"
require "./route.rb"
require "./train.rb"
require "./station.rb"
require "./station_interface.rb"
require "./train_interface.rb"
require "./main_interface.rb"
# модуль вспомогательного обработки данных для вывода и обработки данных
def menu_show(menu)
  puts "Выберите действие"
  menu.sort.each { |screen| puts "#{screen[0]}: #{screen[1][0]}" }
  loop { break if method_exec(menu) }
  #
end

def menu_clear
  system("clear") || system("cls")
end

def menu_change(menu)
  puts "Выбирете"
  i = 0
  menu.each_with_index { |text, number| puts "#{number}: #{text}" }
  loop do
    print ">"
    i = gets.chomp.to_i
    if i >= 0 && i < menu.count
      break
    end
  end
  i
end

# запуск  интерпретатора команд
def method_exec(menu)
  print ">"
  str = gets.chomp.to_sym
  if menu.has_key?(str)
    func = menu[str]
    menu_clear
    method(func[1]).call
    true
  else
    false
  end
end

def print_text(text, text1 = "")
  puts "#{text} #{text1}"
  puts "Для продолжения нажмите  клавишу Ввод"
  gets
  menu_clear
end

def array_name(obj)
  name = []
  obj.each { |st| name << st.name }
  name
end

def show_array(obj, text1, text2 = "")
  array_name(obj).each { |text| puts text }
  print_text(text1, text2)
end
# улучшенный выбор
def change(array, text, obj = nil)
  menu_clear
  menu ={}
  puts "Выберите #{text}"
  array.each_with_index do |value, key|
    menu[key.to_sym] = value
    puts "#{key} : #{value.name}"
  end
  menu['99'.to_sym] = obj
  str = " "
  puts "99 : возврат в предыдущее меню"
  until menu.has_key?(str)
    print ">"
    str = gets.chomp.to_sym
  end
  menu[str]
end
