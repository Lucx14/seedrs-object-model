require 'campaign'

describe Campaign do
  subject(:campaign) { described_class.new('test_name', 'test_URL', 1000, 'transport', 'United_kingdom', 10) }

  describe '#invest' do
    it 'adds to the amount invested' do
      campaign.invest(10)
      expect(campaign.total).to eq 10
    end

    it 'only accepts multiples of the investment multiple' do
      expect { campaign.invest(9) }.to raise_error 'Error: must be a multiple of the investment multiple'
    end
  end

  describe '#percentage_raised' do
    it 'calculates the percentage raised' do
      campaign.invest(100)
      expect(campaign.percentage_raised).to eq 10
    end
  end
end
