class Temperature
  attr_accessor :date_interval, :temperature

  def initialize(date_interval:, temperature:)
    @date_interval = date_interval
    @temperature = temperature.to_i
  end
end
