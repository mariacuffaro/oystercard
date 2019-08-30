class Oystercard
  attr_reader :balance, :journeys, :journey

  MAX_LIMIT = 90
  MIN_FARE = 1
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Cannot top up above #{MAX_LIMIT}" if balance_limit_exceeded?(amount)

    @balance += amount
  end

  def touch_in(station,zone)
    raise "Card must have at least #{MIN_FARE} to travel" if insufficient_balance

    @journey_log.start(station,zone)
  end

  def touch_out(station,zone)
    @journey_log.finish(station,zone)
    deduct(@journey_log.journey.fare)
  end

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
