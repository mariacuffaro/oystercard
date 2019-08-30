require './lib/journey'

describe Journey do
  context 'given an origin' do
    let(:origin) { double :station }
    subject { described_class.new(origin) }

    let(:origin) { double :station }

    it 'has an origin' do
      expect(subject.origin).to eq origin
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
        subject.finish(destination)
      end

      it 'has a destination' do
        expect(subject.destination).to eq destination
      end

      it 'knows the journey is complete' do
        expect(subject).to be_complete
      end

      it 'returns calculated fare' do
        expect(subject.fare).to eq subject.calculated_fare
      end

      it 'returns correct fare' do
        origin = Station.new(name: "Walthamstow",zone: 4)
        destination = Station.new(name: "Victoria",zone: 1)
        expect(subject.fare).to eq 4
      end
    end
  end
end
