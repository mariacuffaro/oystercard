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
    limit = subject.max_limit
    expect { subject.top_up(91) }.to raise_error("Cannot top up above #{limit}")
  end
  it { is_expected.to respond_to(:deduct).with(1).argument }
  it 'deducts fare from the balance' do
    subject.top_up(30)
    subject.deduct(5)
    expect(subject.balance).to eq 25
  end
  it { is_expected.to respond_to(:touch_in) }
end
