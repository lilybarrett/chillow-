require 'spec_helper'
require 'date'

  RSpec.describe Apartment do

    let(:lease_start) { Date.parse("2016-9-1") }
    let(:lease_end)   { Date.parse("2017-8-31") }

    let(:occupant_1)  { Occupant.new("Anna", "Amazing") }
    let(:occupant_2)  { Occupant.new("Joe", "Splendid") }
    let(:occupant_3)  { Occupant.new("Luke", "Skywalker") }
    let(:occupants)   { [occupant_1, occupant_2, occupant_3] }

    let(:apartment) do
      Apartment.new("1368 Commonwealth Ave", "Boston", "MA", "02134", "$1500", lease_start, lease_end, 2)
    end

    describe '#initialize' do
      
      it "has a readable address" do
        expect(apartment.address).to eq("1368 Commonwealth Ave")
      end

      it "does not have a writeable address" do
        expect{ apartment.address = "California Dreamin' Ave" }.to raise_error(NoMethodError)
      end

      it "has a readable city or town" do
        expect(apartment.city_or_town).to eq("Boston")
      end

      it "does not have a writeable address" do
        expect{ apartment.city_or_town = "San Francisco" }.to raise_error(NoMethodError)
      end

      it "has a readable state" do
        expect(apartment.state).to eq("MA")
      end

      it "does not have a writeable state" do
        expect{ apartment.state = "Cali" }.to raise_error(NoMethodError)
      end

      it "has a readable zip code" do
        expect(apartment.zip_code).to eq("02134")
      end

      it "does not have a writeable zip code" do
        expect{ apartment.zip_code = "01345" }.to raise_error(NoMethodError)
      end

      it "has a rent per month" do
        expect(apartment.rent_per_mo).to eq("$1500")
      end

      it "does not have a writeable rent" do
        expect{ apartment.rent_per_mo = "$0" }.to raise_error(NoMethodError)
      end

      it "has a lease start date" do
        expect(apartment.lease_start).to be_a(Date)
      end

      it "does not have a writeable start date" do
        expect{ apartment.lease_start = "#{Date.today}" }.to raise_error(NoMethodError)
      end

      it "has a lease end date" do
        expect(apartment.lease_end).to be_a(Date)
      end

      it "does not have a writeable end date" do
        expect{ apartment.lease_end = "#{Date.today}" }.to raise_error(NoMethodError)
      end

      it "has a readable capacity value" do
        expect(apartment.capacity).to eq(2)
      end

      it "does not have a writeable capacity value" do
        expect{ apartment.capacity = 3 }.to raise_error(NoMethodError)
      end

      it "has an empty array for roommates" do
        expect(apartment.roommates).to eq([])
      end
    end

    describe '#add_roommate' do
      it "adds roommates to the apartment" do
        apartment.add_roommate(occupant_1)
        expect(apartment.roommates.length).to eq(1)
        apartment.add_roommate(occupant_2)
        expect(apartment.roommates.length).to eq(2)
      end
    end

    describe 'remove_roommate' do
        it "removes roommates from the apartment" do
        apartment.add_roommate(occupant_1)
        apartment.add_roommate(occupant_2)
        apartment.remove_roommate(occupant_1)
        expect(apartment.roommates.length).to eq(1)
        apartment.remove_roommate(occupant_2)
        expect(apartment.roommates.length).to eq(0)
      end
    end

    describe '#full?' do
      it "returns true if at capacity" do
        apartment.add_roommate(occupant_1)
        apartment.add_roommate(occupant_2)
        expect(apartment.full?).to eq(true)
      end

      it "returns false if not at capacity" do
        apartment.add_roommate(occupant_1)
        expect(apartment.full?).to eq(false)
      end
    end

  end
