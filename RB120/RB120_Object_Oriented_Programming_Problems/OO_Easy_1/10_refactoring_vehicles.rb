class Vehicles
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::NUMBER_OF_WHEELS
  end
end

class Car < Vehicles
  NUM_OF_WHEELS = 4
end

class Motorcycle < Vehicles
  NUM_OF_WHEELS = 2
end

class Truck < Vehicles
  attr_reader :payload
  
  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  NUM_OF_WHEELS = 6
end