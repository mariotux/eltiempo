require 'time'
require 'calculators/today_calculator'

RSpec.describe TodayCalculator do
  subject(:calculator) { described_class.new }

  describe '.calculate' do
    let(:temperatures) do
      [
        double(date_interval: Time.parse('20200508 02:00'), temperature: 1),
        double(date_interval: Time.parse('20200508 05:00'), temperature: 2),
        double(date_interval: Time.parse('20200508 08:00'), temperature: 3),
        double(date_interval: Time.parse('20200508 11:00'), temperature: 4),
        double(date_interval: Time.parse('20200508 14:00'), temperature: 5),
        double(date_interval: Time.parse('20200508 17:00'), temperature: 6),
        double(date_interval: Time.parse('20200508 20:00'), temperature: 7),
        double(date_interval: Time.parse('20200508 23:00'), temperature: 8)
      ]
    end
    let(:days) { [double(temperatures: temperatures), double(temperatures: []), double(temperatures: [])] }

    context 'when the current hour of today is 03:45' do
      let(:expected_temperature) { 1 }

      before do
        allow(Time).to receive(:now).and_return(Time.parse('20200508 03:45'))
      end

      it { expect(calculator.calculate(days)).to eq(expected_temperature) }
    end

    context 'when the current hour of today is 23:12' do
      let(:expected_temperature) { 8 }

      before do
        allow(Time).to receive(:now).and_return(Time.parse('20200508 23:12'))
      end

      it { expect(calculator.calculate(days)).to eq(expected_temperature) }
    end

  end
end
