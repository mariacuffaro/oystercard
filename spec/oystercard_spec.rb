require './lib/oystercard.rb'

describe Oystercard do
  it 'starts with a zero balance' do
    expect(subject.balance).to eq(0)
  end

  describe '#top-up' do
    it 'updates balance with top up amount' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end

    it 'cannot be topped up above top-up limit' do
      limit = Oystercard::MAX_LIMIT
      expect { subject.top_up(limit + 1) }.to raise_error("Cannot top up above #{Oystercard::MAX_LIMIT}")
    end
  end

  describe '#touch in' do
    let(:station) { double :station }

    it 'is in journey once touched in' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'cannot touch in if balance too low' do
      expect { subject.touch_in(station) }.to raise_error "Card must have at least #{Oystercard::MIN_FARE} to travel"
    end

    it 'knows the station where it touched in' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#touch out' do
    it 'is not in journey once touched out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts the minimum fare' do
      subject.top_up(5)
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'forgets the entry station' do
      subject.touch_out
      expect(subject.entry_station).to be_nil
    end
  end
end
