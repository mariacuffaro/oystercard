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
end
