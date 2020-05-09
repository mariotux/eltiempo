require_relative 'factories/calculator_factory'

class Application
  def initialize(params_handler, api_manager)
    @params = params_handler
    @api = api_manager
  end

  def call
    calculator = CalculatorFactory.build(@params.option)
    location = @api.location(@params.location)
    days = @api.prediction(location)
    calculator.calculate(days)
  end
end
