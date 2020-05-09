require 'application'
require 'errors/invalid_option_error'
require 'errors/calculator_not_found_error'
require 'factories/calculator_factory'

RSpec.describe Application do
  subject(:app) { described_class.new(params_handler, api_manager) }

  describe '.call' do
    context 'when the app looks for the temperature' do
      let(:params_handler) { double(option: '-today', location: 'Gavà') }
      let(:api_manager) { double(location: double('location'), prediction: [double('day')])}
      let(:calculator) { double(calculate: true) }
      before do
        allow(CalculatorFactory).to receive(:build).and_return(calculator)
      end

      it { expect(api_manager).to receive(:location).once }
      it { expect(api_manager).to receive(:prediction).once }
      it { expect(CalculatorFactory).to receive(:build).once }
      it { expect(calculator).to receive(:calculate).once }

      after do
        app.call
      end
    end
  end
end
