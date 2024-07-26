class PassengerCarriage < Carriage
  def initialize(name, total, train)
    @count = 0
    super
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
