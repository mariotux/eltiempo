require 'factories/calculator_factory'
require 'errors/calculator_not_found_error'

RSpec.describe CalculatorFactory do
  describe '.build' do
    context 'when type is -today' do
      let(:type) { '-today' }

      it { expect(described_class.build(type)).to be_instance_of(TodayCalculator) }
    end

    context 'when type is -av_max' do
      let(:type) { '-av_max' }

      it { expect(described_class.build(type)).to be_instance_of(AvMaxCalculator) }
    end

    context 'when type is -av_min' do
      let(:type) { '-av_min' }

      it { expect(described_class.build(type)).to be_instance_of(AvMinCalculator) }
    end

    context 'when the type is not valid' do
      let(:type) { '-not_valid' }

      it { expect{described_class.build(type)}.to raise_error(CalculatorNotFoundError) }
    end
  end
end
