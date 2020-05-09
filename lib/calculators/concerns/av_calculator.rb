module AvCalculator
  def av_calcule(days, attribute_name)
    sum_temperatures = 0
    days.each { |day| sum_temperatures += day.send(attribute_name) }

    sum_temperatures / days.length
  end
end
