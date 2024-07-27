# frozen_string_literal: true

class CargoCarriage < Carriage
  def initialize(name, total, train)
    @count = 0.0
    super
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
