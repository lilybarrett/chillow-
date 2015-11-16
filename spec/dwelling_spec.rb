require 'spec_helper'

  RSpec.describe Dwelling do

      let(:dwelling) { Dwelling.new("1368 Commonwealth Ave", "Boston", "MA", "02134") }

      describe '#initialize' do

      it "has a readable address" do
        expect(dwelling.address).to eq("1368 Commonwealth Ave")
      end

      it "does not have a writeable address" do
        expect{ dwelling.address = "Sunshine Blvd" }.to raise_error(NoMethodError)
      end

      it "has a readable city or town" do
        expect(dwelling.city_or_town).to eq("Boston")
      end

      it "does not have a writeable city or town" do
        expect{ dwelling.city_or_town = "London"}.to raise_error(NoMethodError)
      end

      it "has a readable state" do
        expect(dwelling.state).to eq("MA")
      end

      it "does not have a writeable state" do
        expect{ dwelling.state = "RI" }.to raise_error(NoMethodError)
      end

      it "has a readable zip code" do
        expect(dwelling.zip_code).to eq("02134")
      end

      it "does not have a writeable zip code" do
        expect{ dwelling.zip_code = "12345" }.to raise_error(NoMethodError)
      end
    end

  end
