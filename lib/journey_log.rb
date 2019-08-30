class JourneyLog
  attr_reader :journey, :journeys

  def initialize
    @journeys = []
  end

  def start(station,zone)
    @journey = Journey.new(station,zone)
  end

  def finish(station,zone)
    get_current_journey
    @journey.finish(station,zone)
    add_journey_to_log
  end

  private
  def get_current_journey
    @journey ||= Journey.new
  end

  def add_journey_to_log
    @journeys << {:entry_station => @journey.origin.name, :exit_station => @journey.destination.name}
  end
end
