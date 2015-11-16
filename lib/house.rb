class House < Dwelling
  attr_reader :address, :city_or_town, :state, :zip_code, :asking_price

  def initialize(address, city_or_town, state, zip_code, asking_price)
    super(address, city_or_town, state, zip_code)
    @asking_price = asking_price
  end

end
