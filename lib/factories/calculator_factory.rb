require_relative '../calculators/today_calculator'
require_relative '../calculators/av_max_calculator'
require_relative '../calculators/av_min_calculator'

class CalculatorFactory
  def self.build(type)
    case type
    when '-today'
      TodayCalculator.new
    when '-av_max'
      AvMaxCalculator.new
    when '-av_min'
      AvMinCalculator.new
    else
      raise CalculatorNotFoundError, "Not found the calculator type #{type}"
    end
  end
end
