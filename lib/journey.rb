class Journey
  attr_reader :origin, :destination, :calculated_fare

  FIXED_PENALTY = 5
  MINIMUM_FARE = 1

  def initialize(origin)
    @origin = origin
  end

  def finish(destination)
    @destination = destination
  end

  def complete?
    !destination.nil?
  end

  def fare
    complete? ? calculated_fare : FIXED_PENALTY
  end

  def calculated_fare
    MINIMUM_FARE
  end

end
