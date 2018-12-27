require_relative './investment'
# Campaign class
class Campaign
  attr_reader :total

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
end
