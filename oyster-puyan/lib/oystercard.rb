class Oystercard
  DEFAULT_BALANCE = 0
  CARD_LIMIT = 90

  attr_reader :balance, :limit

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = CARD_LIMIT
    @in_use = false
  end

  def top_up(amount)
    raise "Top-up limit of #{@limit} reached" if over_limit?(amount)
    @balance += amount
    @balance
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  private

  def over_limit?(amount)
    (amount + @balance) > @limit
  end
end
