require 'rails_helper'

RSpec.describe Business, type: :model do
  context 'with valid params' do
    let(:user){
      User.create(id:1,
                  first_name: "Greg",
                  last_name: "Landis",
                  email:"glandis@fake.com",
                  username: "glandis",
                  password: "password",
                  password_confirmation: "password")
    }
    let(:business){
      Business.create(id: 1,
                      name: "Biz",
                      description: "Nass",
                      funding_needed: 200
                      )
    }
    let(:region){
      Region.create(id:1,
                    name: "Great",
                    description: "just ok")
    }
    let(:investment){
      Investment.create(id:1,
                        user_id: 1,
                        business_id: 1,
                        amount: 1)
    }
    it 'passes validations' do
      expect(business).to be_valid
    end

    it 'has a region' do
      business.region = region
      expect(business.region).to be(region)
    end

    it 'has categories' do
      expect(business.categories).to eq([])
    end

    it 'has investments' do
      expect(business.investments).to eq([])
    end

    it 'can add to funding' do
      expect(business.funding_to_date).to eq(0)
      user
      investment
      business.add_to_funding
      expect(business.funding_to_date).to eq(1)
    end

    xit 'can sample 6 businesses to the promo page' do

    end

  end
end
