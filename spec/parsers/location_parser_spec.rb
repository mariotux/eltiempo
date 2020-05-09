require 'parsers/location_parser'

RSpec.describe LocationParser do
  subject(:parser) { described_class.new }

  describe '.parse' do
    let(:response) { double(body: File.read("#{RSPEC_ROOT}/data/locations.xml"))}

    context 'when the response has locations' do
      let(:expected_locations) { 3 }

      it { expect(parser.parse(response).length).to eq(expected_locations)}
    end

    context 'when is not a xml response' do
      let(:response) { double(body: 'hello world!') }
      let(:expected_locations) { 0 }

      it { expect(parser.parse(response).length).to eq(expected_locations)}
    end
  end
end
