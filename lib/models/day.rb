class Day
  attr_accessor :date, :temp_min, :temp_max, :temperatures

  def initialize(date:, temp_min:, temp_max:)
    @date = date
    @temp_min = temp_min.to_i
    @temp_max = temp_max.to_i
    @temperatures = []
  end

  def add_temperature(temperature)
    @temperatures.push(temperature)
  end
end
