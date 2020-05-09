require_relative 'concerns/av_calculator'

class AvMinCalculator
  include AvCalculator

  def calculate(days)
    av_calcule(days, 'temp_min')
  end
end
