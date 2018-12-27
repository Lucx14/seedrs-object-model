# Investment class
class Investment
  attr_reader :cash_value, :date

  def initialize(cash_value:)
    @date = Time.now
    @cash_value = cash_value
  end
end
