
class Money
  def initialize(amount, currency)
  @amount = amount
  @currency = currency
end

  def amount
   self.instance_variable_get(:@amount)
  end

  def currency
    self.instance_variable_get(:@currency)
  end

  def inspect
   '%.2f' % self.amount.to_s +  " " + self.currency
  end

end

fifty_eur = Money.new(50, 'EUR')





