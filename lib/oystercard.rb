class Oystercard
  attr_reader :balance, :max_limit, :min_fare
  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
    @in_journey = false
    @min_fare = MIN_FARE
  end

  def top_up(amount)
    if (@balance + amount) > @max_limit
      raise "Cannot top up above #{@max_limit}"
    end

    @balance += amount
  end

  def touch_in
    if @balance < @min_fare
      raise "Card must have at least #{@min_fare} to travel"
    end

    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
    deduct(@min_fare)
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
