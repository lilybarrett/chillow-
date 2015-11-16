require 'spec_helper'

  RSpec.describe Occupant do

    occupant = Occupant.new("Lily", "Barrett")

    describe '#initialize' do

      it "has a readable first name" do
        expect(occupant.first_name).to eq("Lily")
      end

      it "does not have a writeable first name" do
        expect{ occupant.first_name = "Steph" }.to raise_error(NoMethodError)
      end

      it "has a readable last name" do
        expect(occupant.last_name).to eq("Barrett")
      end
      
      it "does not have a writeable last name" do
        expect{ occupant.last_name = "Jones" }.to raise_error(NoMethodError)
      end
    end

  end
