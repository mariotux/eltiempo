require 'calculators/av_min_calculator'

RSpec.describe AvMinCalculator do
  subject(:calculator) { described_class.new }

  describe '.calculate' do
    let(:expected_av_min) { 15 }
    let(:days) { [double(temp_min: 20), double(temp_min: 10)] }

    it { expect(calculator.calculate(days)).to eq(expected_av_min) }
  end
end
