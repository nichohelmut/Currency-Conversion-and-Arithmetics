class Money

  def initialize(amount, curr)
    @amount = amount
    @curr = curr
  end

  def self.conversion_rates(fx = {})
    {'EUR'=>{'USD'=>1.2, 'Bitcoin'=>0.0047},
    'USD'=>{'EUR'=>0.8, 'Bitcoin'=>0.0097},
    'Bitcoin'=>{'USD'=>1.11, 'EUR'=>0.0047}}
  end

  def amount
    @amount
  end

  def curr
    @curr
  end

  def inspect
    '%.2f' % @amount.to_s + " " + @curr
  end

  def convert_to(to_curr)
    if to_curr != self.curr
      @rate = Money.conversion_rates[self.curr][to_curr]
      Money.new(@amount * @rate, to_curr)
    else
      Money.new(@amount, curr)
    end
  end

# --------------------------------------

  def +(other)
    Money.new(self.amount + other.convert_to(self.curr).amount, self.curr)
  end

  def -(other)
    Money.new(self.amount - other.convert_to(self.curr).amount, self.curr)
  end

  def *(other)
    Money.new(self.amount * other, self.curr)
  end

  def /(other)
    Money.new(self.amount / other, self.curr)
  end

  def ==(other)
    self.amount == other.convert_to(self.curr).amount
  end

  def >(other)
    self.amount > other.convert_to(self.curr).amount
  end

  def <(other)
    self.amount < other.convert_to(self.curr).amount
  end

end

  fourty_euro = Money.new(40, "EUR")
  seventy_dollars = Money.new(70, "USD")

p "fourty_euro > seventy_dollars"
p fourty_euro > seventy_dollars
p "fourty_euro < seventy_dollars"
p fourty_euro < seventy_dollars
p "fourty_euro == seventy_dollars"
p fourty_euro == seventy_dollars
p "a = fourty_euro.convert_to('USD')"
a = fourty_euro.convert_to("USD")
p a
p "b = seventy_dollars.convert_to('EUR')"
b = seventy_dollars.convert_to("EUR")
p b








