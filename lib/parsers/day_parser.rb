require 'json'
require 'time'
require_relative '../models/day'
require_relative '../models/temperature'

class DayParser
  def initialize
    @days = []
  end

  def parse(response)
    data = JSON.parse(response.body)
    data['day'].each do |_index, day_data|
      day = build_day_object(day_data)
      @days.push(day)
    end

    @days
  end

  private

  def build_day_object(day_data)
    day = Day.new(date: Time.parse(day_data['date'] + ' ' + day_data['local_time']), temp_min: day_data['tempmin'], temp_max: day_data['tempmax'])
    add_day_temperatures(day, day_data)
    day
  end

  def add_day_temperatures(day, day_data)
    day_data['hour'].each do |hour|
      day.add_temperature(Temperature.new(date_interval: Time.parse(day_data['date'] + ' ' +hour['interval']), temperature: hour['temp']))
    end
  end
end
