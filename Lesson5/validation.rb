module Validation
  def self.included(base)
    base.extend ExtendMethodsValidates
    base.include IncludeMethodsValidates
  end

  module IncludeMethodsValidates
    def _presence(*args)
      raise RzdError, "Значение не может быть пустым " if args[0].nil? || args[0].to_s.strip.empty?
    end

    def _format(*args)
      raise RzdError, "Значание #{args[0]} не соответствует формату  " if (args[0].to_s !~ args[1])
    end

    def _type(*args)
      raise RzdError, "Значание должно быть #{args[1]} " unless args[0].is_a?(args[1])
    end

    def _length(*args)
      raise RzdError, "Значание должно быть  не длиннее #{args[1]} символов " if args[0].to_s.length > (args[1])
    end
  end

  module ExtendMethodsValidates
    def validate(name, *args)
      @_var_type_validate = {
        presence: "_presence",
        type: "_type",
        format: "_format",
        length: "_length",
      }

      hash_full = class_variable_defined?("@@_var_validate") ? class_variable_get("@@_var_validate") : {}

      if !hash_full.key?(name)
        hash_name = {}
        define_method("#{name}=".to_sym) do |value|
          hash_full = self.class.class_variable_get("@@_var_validate")
          hash_name = hash_full["#{name}".to_sym]
          hash_name.each_value do |func|
            method(func[0]).call(value, func[1])
          end
          self.instance_variable_set("@#{name}", value)
        end
      else
        hash_name = hash_full[name]
      end
      hash_name[args[0]] = [@_var_type_validate[args[0].to_sym], args[1]]
      hash_full[name] = hash_name
      class_variable_set("@@_var_validate", hash_full)
    end
  end

  def validate!
    if self.class.class_variable_defined?("@@_var_validate")
      var_validate = self.class.class_variable_get("@@_var_validate")
      var_check = self.instance_variables
      var_validate.each do |key, value|
        if var_check.include?("@#{key}".to_sym)
          value.each_value { |func| method(func[0]).call(self.instance_variable_get("@#{key}".to_sym), func[1]) }
        end
      end
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
