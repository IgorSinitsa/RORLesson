module Menu
  require "./modules.rb"
  def self.included(base)
    base.extend ClassMethodsMenu
    base.include InstanceMethodsMenu
  end

  module ClassMethodsMenu
    include Misc
    attr_accessor :list_obj, :hash_menu, :obj

    def list_obj
      @list_obj ||= {}
    end

    def find(name)
      @list_obj[to_key name]
    end

    def run
      puts "Вы управляете #{@obj.name}" if !@obj.nil?
      method(menu_change).call
    end

    def interface_main # основное меню
      interface_train = lambda { Train.run }
      interface_station = lambda { Station.run }
      interface_route = lambda { Route.run }
      interface_exit = lambda { puts "Спасибо за игру" }
      menu = { "1": ["Управление поездом", interface_train],
               "2": ["Управление станцией", interface_station],
               "3": ["Маршруты", interface_route],
               "99": ["Выход", interface_exit] }
      func = menu_change(menu)
      func.call
    end

    def all
      @list_obj
    end

    def all_name
      arr = []
      @list_obj.each_value { |obj| arr << obj.name }
      arr
    end

    def count
      @list_obj ||= {}
      @list_obj.count
    end

    def load_menu(menu)
      @hash_menu = menu
    end

    def change(menu)
      menu[menu_change(create_hash_menu(menu))]
    end

    def change_array(menu)
      menu[menu_change(create_array_menu(menu))]
    end

    def menu_change(hash_menu = @hash_menu)
      if !hash_menu.nil?
        func = []

        puts "Выбирете"
        hash_menu.sort.each { |number, text| puts "#{number}: #{text[0]}" }
        loop do
          print ">"
          sym = to_key(gets.chomp)
          if !hash_menu[sym].nil?
            func = hash_menu[sym]
            break
          end
        end
        func[1]
      end
    end

    def create_array_menu(menu)
      menu_hash = {}
      number = 0
      menu.each do |value|
        # name = value.name
        menu_hash[to_key(number += 1)] = [value.name, number - 1]
      end
      menu_hash
    end

    def create_hash_menu(hash)
      menu_hash = {}
      number = 0
      hash.sort.each do |key, value|
        menu_hash[to_key(number += 1)] = [value.name, key] if !value.nil?
      end
      menu_hash
    end
  end

  # ---------------------------------------------------------------------------
  module InstanceMethodsMenu
    include Misc

    def initialize(name, *arg)
      self.class.list_obj[to_key name] = self
      self.class.obj = self
    end
  end
end
