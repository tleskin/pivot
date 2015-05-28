require 'rails_helper'

RSpec.describe Investment, type: :model do
  context 'with valid params' do
    let(:investment){
      Investment.create(business_id: 1,
                        user_id: 1,
                        amount: 1)
    }
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
    it 'passes validations' do
      user;region;business;investment
      expect(investment).to be_valid
    end

    it 'can return details' do
      user;region;business;investment
      expect(investment.details.business_name).to eq("Biz")
      expect(investment.details.amount).to eq(1)
    end

    it 'can be generated and added to business funds' do
      user;region;business
      prospects = Portfolio.new({1 => 1})
      Investment.generate(prospects, user.id)
      expect(Investment.all.count).to eq(1)
    end

  end
end
