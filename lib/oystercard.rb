class Oystercard
  attr_reader :balance, :max_limit, :min_limit
  MAX_LIMIT = 90
  MIN_LIMIT = 1

  def initialize
    @balance = 0
    @max_limit = MAX_LIMIT
    @in_journey = false
    @min_limit = MIN_LIMIT
  end

  def top_up(amount)
    raise "Cannot top up above #{@max_limit}" if (@balance + amount) > @max_limit

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Card must have at least #{@min_limit} to travel" if @balance < @min_limit
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    @in_journey = false
  end

end
