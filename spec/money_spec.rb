require_relative '../daWanda'

describe Money do
   context 'When testing the methods' do
    # define variables
    amount1 = 20
    amount2 = 50
    curr1 = "USD"
    curr2 = "EUR"

    twenty_dollars = Money.new(amount1, curr1)
    fifty_euro = Money.new(amount2, curr2)

    arg1 = "EUR"
    arg2 = "USD"

    Money.conversion_rates({'EUR'=>{'USD'=>1.2, 'Bitcoin'=>0.0047},
    'USD'=>{'EUR'=>0.8, 'Bitcoin'=>0.0097},
    'Bitcoin'=>{'USD'=>1.11, 'EUR'=>0.0047}})

    # focus on writing the test logic
      it "calling amount method on an instance returns the amount" do
        expect(twenty_dollars.amount).to eq 20
      end

      it "calling currency method on an instance returns the currency" do
        expect(twenty_dollars.from_curr).to eq "USD"
      end

      it "calling inspect method on an istance returns the amount and the currency in a string" do
        expect(twenty_dollars.inspect).to eq "20.00 USD"
      end

      it "calling convert_to method on an instance returns an instance with the specified currency and the converted amount" do
        result = twenty_dollars.convert_to(arg1)
        expect(result.amount).to eq twenty_dollars.convert_to(arg1).amount
        expect(result.from_curr).to eq twenty_dollars.convert_to(arg1).from_curr
      end

      it "convert_to method does not convert the instance if the specified currency is the same as the original currency" do
        result = twenty_dollars.convert_to(arg2)
        expect(result.amount).to eq twenty_dollars.amount
        expect(result.from_curr).to eq twenty_dollars.from_curr
      end

      it "returns an instance with the amount in the currency of the first instance when addition operator is used" do
        result = twenty_dollars + fifty_euro
        expect(result.amount).to eq twenty_dollars.amount + (fifty_euro.amount * Money.conversion_rates[fifty_euro.from_curr][twenty_dollars.from_curr])
        expect(result.from_curr).to eq twenty_dollars.from_curr
      end

      it "returns an instance with the amount in the currency of the first instance when subtraction operator is used" do
        result = fifty_euro - twenty_dollars
        expect(result.amount).to eq fifty_euro.amount - (twenty_dollars.amount * Money.conversion_rates[twenty_dollars.from_curr][fifty_euro.from_curr])
        expect(result.from_curr).to eq fifty_euro.from_curr
      end

      it "returns an instance with multiplied amount when multiplication operator is used" do
        result = fifty_euro * 3
        expect(result.amount).to eq fifty_euro.amount * 3
      end

      it "returns an instance with divided amount when division operator is used" do
        result = fifty_euro / 3
        expect(result.amount).to eq fifty_euro.amount / 3
      end
   end
end
