module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_to_sym(name)
      "@#{name}".to_sym
    end

    def history_sym(name)
      "@#{name}_history".to_sym
    end

    def attr_accessor_with_history(*attrs)
      attrs.each do |attr|
        define_method(attr) { instance_variable_get(attr_to_sym(attr)) }

        define_method("#{attr}=".to_sym) do |value|
          history = instance_variable_get(history_sym(attr)) || []
          history << instance_variable_get(attr_to_sym(attr))
          instance_variable_set(history_sym(attr), history)
          instance_variable_set(attr_to_sym(attr), value)
        end
      end

      define_method("#{attr}_history") do
        instance_variable_get(history_sym(attr)) || []
      end
    end
  end

  def strong_attr_accessor(attr, klass)
    instance_variable_set("@#{attr}_class".to_sym, klass)

    define_method(attr_sym(attr)) do
      instance_variable_get(attr_to_sym(attr))
    end

    define_method("#{attr}=".to_sym) do |value|
      attr_class = instance_variable_get("@#{attr}_class".to_sym)
      raise TypeError, "Переменная должна быть класса #{attr_class}" unless value.is_a?(attr_class)

      instance_variable_set(attr_to_sym(attr), value)
    end
  end
end
