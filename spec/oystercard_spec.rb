require './lib/oystercard.rb'

describe Oystercard do

  let(:station) { double :station }
  let(:end_station) { double :station }


  def touch_out
    subject.touch_out(end_station,5)
  end

  def touch_in
    subject.touch_in(station,1)
  end

  it 'starts with a zero balance' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it 'updates balance with top up amount' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end

    it 'cannot be topped up above top-up limit' do
      limit = Oystercard::MAX_LIMIT
      expect { subject.top_up(limit + 1) }.to raise_error("Cannot top up above #{Oystercard::MAX_LIMIT}")
    end
  end

  describe '#touch_in' do

    it 'cannot touch in if balance too low' do
      expect { touch_in }.to raise_error "Card must have at least #{Oystercard::MIN_FARE} to travel"
    end

  end

  describe '#touch_out' do
    before :each do
      subject.top_up(5)
      touch_in
    end

    it 'deducts the correct fare' do
      expect { touch_out }.to change { subject.balance }.by(-5)
    end

  end

end
