require 'spec_helper'

  RSpec.describe House do

    let(:house) { House.new("1368 Commonwealth Ave", "Boston", "MA", "02134", "$1,000,000") }

    describe '#initialize' do

      it "has a readable address" do
        expect(house.address).to eq("1368 Commonwealth Ave")
      end

      it "does not have a writeable address" do
        expect{ house.address = "Just Over the Rainbox" }.to raise_error(NoMethodError)
      end

      it "has a readable city or town" do
        expect(house.city_or_town).to eq("Boston")
      end

      it "does not have a writeable city of town" do
        expect{ house.city_or_town = "NYC" }.to raise_error(NoMethodError)
      end

      it "has a readable zip code" do
        expect(house.zip_code).to eq("02134")
      end

      it "does not have a writeable zip code" do
        expect{ house.zip_code = "00000" }.to raise_error(NoMethodError)
      end

      it "has a readable asking price" do
        expect(house.asking_price).to eq("$1,000,000")
      end
      
      it "does not have a writeable asking price" do
        expect{ house.asking_price = "$0" }.to raise_error(NoMethodError)
      end
    end


end
