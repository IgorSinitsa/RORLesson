class CargoCarriage
  include Menu
  include Validate
  attr_reader :name, :total, :count
  class << self

  end

  def initialize(name, total, train)
    @name = name
    @total = total
    @count = 0.0
    validate_carriage!(self ,train)
    train.carriages[to_key name] = self

  end
  def free_quantity
    @total - @count
  end

  def volume_in(volume)
    if (volume + @count) < @total
      @count += volume
      true
    else
      false
    end
  end
end
