class Oystercard
  attr_reader :balance, :entry_station

  MAX_LIMIT = 90
  MIN_FARE = 1
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @max_limit = MAX_LIMIT
    @min_fare = MIN_FARE
    @entry_station = nil
  end

  def top_up(amount)
    raise "Cannot top up above #{@max_limit}" if balance_limit_exceeded?(amount)

    @balance += amount
  end

  def touch_in(station)
    raise "Card must have at least #{@min_fare} to travel" if insufficient_balance

    @entry_station = station
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out
    @entry_station = nil
    deduct(@min_fare)
  end

  private

  def insufficient_balance
    @balance < @min_fare
  end

  def balance_limit_exceeded?(amount)
    (@balance + amount) > @max_limit
  end

  def deduct(amount)
    @balance -= amount
  end

end
