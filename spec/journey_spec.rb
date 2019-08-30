require './lib/journey'
require './lib/station'

describe Journey do
  context 'given an origin' do
    let(:station) { double :station }
    let(:zone) { double :zone }
    subject { described_class.new(station,zone) }

    let(:origin) { double :station }

    it 'origin is a new instance of Station' do
      expect(subject.origin).to be_kind_of(Station)
    end

    it 'has fixed penalty by default' do
      expect(subject.fare).to eq described_class::FIXED_PENALTY
    end

    context 'given a destination' do
      let(:destination) { double :station }

      before(:each) do
        subject.finish(destination,zone)
      end

      it 'destination is a new instance of Station' do
        expect(subject.destination).to be_kind_of(Station)
      end

      it 'calculates correct fare' do
        subject.origin = Station.new("Walthamstow",4)
        subject.destination = Station.new("Victoria",1)
        expect(subject.fare).to eq 4
      end
    end
  end
end
