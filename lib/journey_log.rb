class JourneyLog
  attr_reader :journey, :journeys

  def initialize
    @journeys = []
  end

  def start(station,zone)
    @journey = Journey.new(station,zone)
  end

  def finish(station,zone)
    current_journey
    @journey.finish(station,zone)
    @journeys << {:entry_station => @journey.origin, :exit_station => @journey.destination}
    #@journey = nil
  end

  private
  def current_journey
    @journey ||= Journey.new
  end
end
