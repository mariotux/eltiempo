require 'managers/api_manager'
require 'models/location'

RSpec.describe ApiManager do
  subject(:api) { described_class.new(config, location_parser, day_parser) }

  let(:config) { {'lang': 'es', 'division_id': '1', 'affiliate_id': '2'} }
  let(:location_parser) { double(parse: true) }
  let(:day_parser) { double(parse: true) }

  describe '.location' do
    context 'when the location is available' do
      let(:location_name) { 'location_2' }
      let(:expected_location_name) { 'location_2' }
      let(:locations) { [double(name: 'location_1'), double(name: 'location_2')] }

      before do
        allow(api).to receive(:get_locations).and_return(locations)
      end

      it { expect(api.location(location_name).name).to eq(expected_location_name)}
    end

    context 'when the location is not available' do
      let(:location_name) { 'location_3' }
      let(:locations) { [double(name: 'location_1'), double(name: 'location_2')] }

      before do
        allow(api).to receive(:get_locations).and_return(locations)
      end

      it { expect { api.location(location_name) } .to raise_error(LocationNotFoundError) }
    end

    context 'when the api behavior is not ok' do
      let(:location_name) { 'location_3' }
      let(:response) { double(code: '400') }

      before do
        allow(api).to receive(:do_request).and_return(response)
      end

      it { expect { api.location(location_name) } .to raise_error(ApiError) }
    end
  end

  describe '.prediction' do
    context 'when location has prediction' do
      let(:expected_days) { 3 }
      let(:location) { double(id: 1) }
      let(:day_parser) { double(parse: [double('day'), double('day'), double('day')]) }
      let(:response) { double(code: '200') }

      before do
        allow(api).to receive(:do_request).and_return(response)
      end

      it { expect(api.prediction(location).length).to eq expected_days }
    end

    context 'when the api behavior is not ok' do
      let(:location) { double(id: 1) }
      let(:response) { double(code: 400) }

      before do
        allow(api).to receive(:do_request).and_return(response)
      end

      it { expect { api.prediction(location) } .to raise_error(ApiError) }
    end
  end
end
