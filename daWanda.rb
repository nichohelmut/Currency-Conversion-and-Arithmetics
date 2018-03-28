class Money
  attr_accessor :amount, :converted_amount

  def initialize(amount, from_curr)
    @amount = amount
    @from_curr = from_curr
  end

  def self.conversion_rates(attr = {})
    # @conv_rates = {from_curr = {rates}} Use Hard Code for now
    # refactor to arrt ={}
    return {'EUR'=>{'USD'=>1.11, 'Bitcoin'=>0.0047},
    'USD'=>{'EUR'=>0.8, 'Bitcoin'=>0.0097},
    'Bitcoin'=>{'USD'=>1.11, 'EUR'=>0.0047}}
  end

  def amount
    @amount
  end

  def from_curr
    @from_curr
  end

  def inspect
    '%.2f' % @amount.to_s + " " + @from_curr
  end

  def convert_to(to_curr)
    if to_curr != self.from_curr
      @rate = Money.conversion_rates[self.from_curr]["#{to_curr}"]
      @converted_amount = @amount * @rate
    else
      @amount
    end
  end
# --------------------------------------
  def +(other)
    self.amount + other.amount
  end

  def -(other)
    self.amount - other.amount
  end

  def *(other)
    self.amount * other
  end

  def /(other)
    self.amount / other
  end
end

a = Money.new(20, "USD")
twenty_dollars  = a.convert_to("EUR")
fifty_euro = Money.new(50, "EUR").amount
