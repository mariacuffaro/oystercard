class Journey
  attr_reader :origin, :destination

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
    complete? ? MINIMUM_FARE : FIXED_PENALTY
  end
  
end
