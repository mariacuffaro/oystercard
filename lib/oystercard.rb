class Oystercard
  attr_reader :balance, :journeys, :journey

  MAX_LIMIT = 90
  MIN_FARE = 1
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot top up above #{MAX_LIMIT}" if balance_limit_exceeded?(amount)

    @balance += amount
  end

  def touch_in(station)
    raise "Card must have at least #{MIN_FARE} to travel" if insufficient_balance

    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey.finish(station)
    deduct(@journey.fare)

    @journeys << @journey
    @journey = nil
  end

  # def in_journey?
  #   @journey != nil
  # end

  private

  def insufficient_balance
    @balance < MIN_FARE
  end

  def balance_limit_exceeded?(amount)
    (@balance + amount) > MAX_LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end
end
