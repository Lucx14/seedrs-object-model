require_relative './investment'
# Campaign class
class Campaign
  attr_reader :total, :investments

  def initialize(campaign_name, campaign_image, target_amount, sector, country, investment_multiple, investment = Investment)
    @campaign_name = campaign_name
    @campaign_image = campaign_image
    @target_amount = target_amount
    @sector = sector
    @country = country
    @investment_multiple = investment_multiple
    @investments = []
    @total = 0
    @investment = investment
  end

  def invest(amount)
    raise 'Error: must be a multiple of the investment multiple' unless correct_multiple?(amount)
    raise 'Error: campaign is now fully funded' if fully_funded?
    raise 'Error: amount must be positive' unless positive?(amount)

    create_and_store_investment(amount)
  end

  def percentage_raised
    (@total.to_f / @target_amount) * 100
  end

  private

  def correct_multiple?(amount)
    (amount % @investment_multiple).zero?
  end

  def create_and_store_investment(amount)
    @total += amount
    @investments << @investment.new(cash_value: amount)
  end

  def fully_funded?
    @total == @target_amount
  end

  def positive?(amount)
    amount.positive?
  end 
end
