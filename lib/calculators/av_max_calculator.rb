require_relative 'concerns/av_calculator'

class AvMaxCalculator
  include AvCalculator

  def calculate(days)
    av_calcule(days, 'temp_max')
  end
end
