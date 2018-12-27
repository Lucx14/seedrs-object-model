require 'investment'

describe Investment do
  subject(:investment) { described_class.new(cash_value: 20) }

  describe '#date' do
    it 'can read the date attribute' do
      allow(Time).to receive(:now).and_return(Time.mktime(2018, 12, 27))
      expect(investment.date).to eq(Time.mktime(2018, 12, 27))
    end
  end

  describe '#cash_value' do
    it 'can read the cash_value attribute' do
      expect(investment.cash_value).to eq 20
    end
  end
end
