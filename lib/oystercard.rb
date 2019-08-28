class Oystercard
  attr_reader :balance, :entry_station
  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
    @min_fare = MIN_FARE
    @entry_station = nil
  end

  def top_up(amount)
    if (@balance + amount) > @max_limit
      raise "Cannot top up above #{@max_limit}"
    end

    @balance += amount
  end

  def touch_in(station)
    if @balance < @min_fare
      raise "Card must have at least #{@min_fare} to travel"
    end

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
  def deduct(amount)
    @balance -= amount
  end

end
