require_relative '../errors/invalid_parameters_error'
require_relative '../errors/invalid_option_error'

class ParamsHandler
  VALID_OPTIONS = %w[-today -av_max -av_min].freeze

  def initialize(params)
    @params = params
  end

  def option
    raise InvalidOptionError, "Option: [ #{@params.first} ] is not valid" unless valid_option?
    raise InvalidParametersError, 'Option param is required' unless one_or_more_params?

    raise_error_required_params if more_than_two_params?

    @params.first
  end

  def location
    raise InvalidParametersError, 'Location param is required' unless more_than_one_param?

    raise_error_required_params if more_than_two_params?

    @params.last
  end

  private

  def raise_error_required_params
    raise InvalidParametersError, 'Must have two params to run the command'
  end

  def valid_option?
    VALID_OPTIONS.include?(@params.first)
  end

  def one_or_more_params?
    @params.length >= 1
  end

  def more_than_one_param?
    @params.length > 1
  end

  def more_than_two_params?
    @params.length > 2
  end
end
