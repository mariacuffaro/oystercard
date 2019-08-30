require './lib/journey_log'

describe JourneyLog do

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  it 'creates a new Journey when the journey starts' do
    subject.start(entry_station)
    expect(subject.journey).not_to be_nil
  end

  it "adds entry station to the journey log" do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.journeys[-1][:entry_station]).to eq(entry_station)
  end

  it "adds exit station to the journey log" do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.journeys[-1][:exit_station]).to eq(exit_station)
  end

end
