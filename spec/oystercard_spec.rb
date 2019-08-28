require './lib/oystercard.rb'

describe Oystercard do

  it 'starts with a zero balance' do
    expect(subject.balance).to eq(0)
  end
  it { is_expected.to respond_to(:top_up).with(1).argument }
  it 'updates balance with top up amount' do
    subject.top_up(5)
    expect(subject.balance).to eq(5)
  end
  it 'cannot be topped up above top-up limit' do
    expect { subject.top_up(91) }.to raise_error("Cannot top up above #{Oystercard::MAX_LIMIT}")
  end
  describe '#touch in' do
    it 'is in journey once touched in' do
      subject.top_up(1)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'cannot touch in if balance too low' do
      expect { subject.touch_in }.to raise_error "Card must have at least #{Oystercard::MIN_FARE} to travel"
    end
  end
  describe '#touch out' do
    it 'is not in journey once touched out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
    it 'deducts the minimum fare once touched out' do
      subject.top_up(5)
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end
  end

end
