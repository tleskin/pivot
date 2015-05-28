require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'with valid params' do
    let(:region){
      Region.create(id: 1,
                    name: "region",
                    description: "description"
                    )
    }
    let(:business){
      Business.create(id: 1,
                      name: "Biz",
                      description: "Nass",
                      funding_needed: 200
                      )
    }


    it 'is valid' do
      expect(region).to be_valid
    end

    it 'has businesses' do
      expect(region.businesses).to eq([])
    end

    it 'can return count of businesses' do
      expect(region.business_count).to eq(0)
      region.businesses << business
      expect(region.business_count).to eq(1)
    end
  end
end
