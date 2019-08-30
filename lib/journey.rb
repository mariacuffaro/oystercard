class Journey
  attr_accessor :origin, :destination

  FIXED_PENALTY = 5
  MINIMUM_FARE = 1

  def initialize(station,zone)
    @origin = Station.new(station,zone)
    @destination = Station.new
  end

  def finish(station,zone)
    @destination = Station.new(station,zone)
  end

  def complete?
    !destination.nil?
  end

  def fare
    complete? ? calculated_fare : FIXED_PENALTY
  end

  def calculated_fare
    (@destination.zone - @origin.zone).abs + 1
  end

end
