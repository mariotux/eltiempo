require 'net/http'
require_relative '../errors/api_error'
require_relative '../errors/location_not_found_error'

class ApiManager
  API_URL = 'http://api.tiempo.com/index.php'.freeze

  def initialize(config, location_parser, day_parser)
    @lang = config['lang']
    @division_id = config['division_id']
    @affiliate_id = config['affiliate_id']
    @location_parser = location_parser
    @day_parser = day_parser
  end

  def location(location_name)
    @locations ||= get_locations

    location = @locations.find { |l| l.name == location_name }
    raise LocationNotFoundError, "Location #{location_name} not found" unless location

    location
  end

  def prediction(location)
    params = { api_lang: @lang, localidad: location.id, affiliate_id: @affiliate_id, v: '3.0' }
    response = get_request_or_raise_error(params, 'predictions')

    @day_parser.parse(response)
  end

  private

  def get_locations
    params = { api_lang: @lang, division: @division_id, affiliate_id: @affiliate_id }
    response = get_request_or_raise_error(params, 'locations')

    @location_parser.parse(response)
  end

  def get_request_or_raise_error(params, type)
    response = do_request(params)
    raise ApiError, "Error asking for #{type}" if response.code != '200'

    response
  end

  def do_request(params)
    uri = URI(API_URL)
    uri.query = URI.encode_www_form(params)
    Net::HTTP.get_response(uri)
  end
end
