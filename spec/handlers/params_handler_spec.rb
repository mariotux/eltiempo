require 'handlers/params_handler'
require 'errors/invalid_parameters_error'
require 'errors/invalid_option_error'

RSpec.describe ParamsHandler do
  subject(:handler) { described_class.new(params) }

  describe '.option' do
    context 'when it has an invalid option' do
      let(:params) { ['-no_valid'] }

      it { expect { handler.option }.to raise_error(InvalidOptionError) }
    end

    context 'when it has an option' do
      let(:params) { ['-today'] }

      it { expect(handler.option).to eq(params.first) }
    end

    context 'when it has an option and location' do
      let(:params) { %w[-today Gavá] }

      it { expect(handler.option).to eq(params.first) }
    end

    context 'when it has more parameters than the handler needs' do
      let(:params) { %w[-today Gavá Mordor] }

      it { expect { handler.option }.to raise_error(InvalidParametersError) }
    end
  end

  describe '.location' do
    context 'when it has not a location' do
      let(:params) { ['-today'] }

      it { expect { handler.location }.to raise_error(InvalidParametersError) }
    end

    context 'when it has an option and location' do
      let(:params) { %w[-today Gavá] }

      it { expect(handler.location).to eq(params.last) }
    end

    context 'when it has more parameters than the handler needs' do
      let(:params) { %w[-today Gavá Mordor] }

      it { expect { handler.option }.to raise_error(InvalidParametersError) }
    end
  end
end
