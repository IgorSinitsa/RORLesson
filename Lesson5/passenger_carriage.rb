class PassengerCarriage
  include Menu
  include Validate
  attr_reader :name, :total, :count
  class << self
  end

  def initialize(name, total, train)
    @name = name
    @total = total
    @count = 0
    validate_carriage!(self ,train)
    train.carriages[to_key name] = self

  end

  def free_quantity
    @total - @count
  end

  def passenger_in
    if @count < @total
      @count += 1
      true
    else
      false
    end
  end
end
