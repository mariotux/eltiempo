require 'parsers/day_parser'

RSpec.describe DayParser do
  subject(:parser) { described_class.new }

  describe '.parse' do
    let(:response) { double(body: File.read("#{RSPEC_ROOT}/data/prediction.json"))}
    context 'when the prediction has 5 days' do
      let(:expected_days) { 5 }

      it { expect(parser.parse(response).length).to eq(expected_days)}
    end

    context 'when each day has 8 temperatures' do
      let(:expected_temperatures) { 8 }

      it { expect(parser.parse(response).first.temperatures.length).to eq(expected_temperatures)}
    end

    context 'when is not a json response' do
      let(:response) { double(body: 'hello world!') }

      it { expect{ parser.parse(response) }.to raise_error(JSON::ParserError) }
    end
  end
end
