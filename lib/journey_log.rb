class JourneyLog
  attr_reader :journey, :journeys

  def initialize
    @journeys = []
  end

  def start(station)
    @journey = Journey.new(station)
  end

  def finish(station)
    current_journey
    @journey.finish(station)
    @journeys << {:entry_station => @journey.origin, :exit_station => @journey.destination}
    #@journey = nil
  end

  private
  def current_journey
    @journey ||= Journey.new
  end
end
