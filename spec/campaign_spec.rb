require 'campaign'

describe Campaign do

  let(:mock_investment) { double :investment, new: nil }
  subject(:campaign) { described_class.new('test_name', 'test_URL', 1000, 'transport', 'United_kingdom', 10, mock_investment) }

  describe '#invest' do
    it 'creates a new Investment object' do
      expect(mock_investment).to receive(:new).with(cash_value: 10)
      campaign.invest(10)
    end 

    it 'adds to the amount invested' do
      expect { campaign.invest(10) }.to change { campaign.total }.by(10)
    end

    it 'only accepts multiples of the investment multiple' do
      expect { campaign.invest(9) }.to raise_error 'Error: must be a multiple of the investment multiple'
    end

    it 'only accepts positive investments' do
      expect { campaign.invest(-10) }.to raise_error 'Error: amount must be positive'
    end 

    it 'adds an investment to the investments array' do
      campaign.invest(10)
      expect(campaign.investments.length).to eq 1
    end

    it 'prevents investment once fully funded' do
      campaign.invest(1000)
      expect { campaign.invest(10) }.to raise_error 'Error: campaign is now fully funded'
    end
  end

  describe '#percentage_raised' do
    it 'calculates the percentage raised' do
      campaign.invest(100)
      expect(campaign.percentage_raised).to eq 10
    end
  end
end
