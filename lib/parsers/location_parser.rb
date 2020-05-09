require 'nokogiri'
require_relative '../models/location'

class LocationParser
  def initialize
    @locations = []
  end

  def parse(response)
    doc = Nokogiri::XML(response.body)
    doc.xpath('//name').each do |node|
      @locations.push(Location.new(name: node.text, id: node['id']))
    end

    @locations
  end
end
