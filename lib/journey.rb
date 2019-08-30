class Journey
  attr_accessor :origin, :destination

  FIXED_PENALTY = 5
  MINIMUM_FARE = 1

  def initialize(station,zone)
    @origin = Station.new(station,zone)
  end

  def finish(station,zone)
    @destination = Station.new(station,zone)
  end

  def fare
    complete? ? calculated_fare : FIXED_PENALTY
  end

  private
  
  def calculated_fare
    (@destination.zone - @origin.zone).abs + 1
  end

  def complete?
    !destination.nil?
  end

end
