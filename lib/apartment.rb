require_relative 'dwelling'

class Apartment < Dwelling
  attr_reader :address, :city_or_town, :state, :zip_code, :rent_per_mo, :lease_start, :lease_end, :capacity, :roommates

  def initialize(address, city_or_town, state, zip_code, rent_per_mo, lease_start, lease_end, capacity)
    super(address, city_or_town, state, zip_code)
    @rent_per_mo = rent_per_mo
    @lease_start = lease_start
    @lease_end = lease_end
    @capacity = capacity
    @roommates = []
  end

  def add_roommate(roommate)
    if !full?
      @roommates << roommate
    end
  end

  def remove_roommate(roommate)
    @roommates.delete(roommate)
  end

  def full?
    roommates.length == capacity
  end

end
