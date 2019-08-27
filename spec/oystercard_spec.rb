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
    expect { subject.top_up(91) }.to raise_error("Unable to top up above #{subject.max_limit}")
  end
end
