require './lib/journey'
require './lib/station'

describe Journey do
  context 'given an origin' do
    let(:station) { double :station }
    let(:zone) { double :zone }
    subject { described_class.new(station,zone) }
    let(:zone_a) {1}
    let(:zone_b) {2}

    let(:origin) { double :station }

    it 'has an origin' do
      expect(subject.origin).to be_kind_of(Station)
    end

    it 'knows the journey is not complete' do
      expect(subject).not_to be_complete
    end

    it 'has fixed penalty by default' do
      expect(subject.fare).to eq described_class::FIXED_PENALTY
    end

    context 'given a destination' do
      let(:destination) { double :station }

      before(:each) do
        subject.finish(destination,zone)
      end

      it 'has a destination' do
        expect(subject.destination).to be_kind_of(Station)
      end

      it 'knows the journey is complete' do
        subject { described_class.new("Walthamstow",zone_a) }
        subject.finish("Victoria",zone_b)
        expect(subject.fare).to eq subject.calculated_fare
      end

      it 'returns correct fare' do
        origin = Station.new("Walthamstow",4)
        destination = Station.new("Victoria",1)
        expect(subject.fare).to eq 4
      end
    end
  end
end
