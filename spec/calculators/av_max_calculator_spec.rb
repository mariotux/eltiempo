require 'calculators/av_max_calculator'

RSpec.describe AvMaxCalculator do
  subject(:calculator) { described_class.new }

  describe '.calculate' do
    let(:expected_av_max) { 15 }
    let(:days) { [double(temp_max: 20), double(temp_max: 10)] }

    it { expect(calculator.calculate(days)).to eq(expected_av_max) }
  end
end
