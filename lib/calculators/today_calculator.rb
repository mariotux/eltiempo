class TodayCalculator
  def calculate(days)
    find_temperature_from_now(days.first)
  end

  private

  def find_temperature_from_now(today)
    @current_date = Time.now
    @last_temperature = nil
    today.temperatures.each do |temp|
      @last_temperature = temp if valid_temperature?(temp)
    end
    @last_temperature.temperature
  end

  def valid_temperature?(temp)
    @current_date > temp.date_interval || @last_temperature.nil?
  end
end
