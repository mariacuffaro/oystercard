class JourneyLog
  attr_reader :journey, :journeys

  def initialize
    @journeys = []
  end

  def start(station)
    @journey = Journey.new(station)
  end

  def finish(station)
    @journey.finish(station)
    @journeys << {:entry_station => @journey.origin, :exit_station => @journey.destination}
    @journey = nil
  end

end