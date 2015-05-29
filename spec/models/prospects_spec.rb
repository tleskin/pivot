require 'rails_helper'

RSpec.describe Prospects, type: :model do
  context 'with valid params' do
    let(:prospect){
      Prospects.new({})
    }
    let(:business){
      Business.create(id: 1,
                   name: "Biz",
                   description: "Nass",
                   funding_needed: 12)
    }
    it 'can add contents' do
      prospect.contents.class
      prospect.add({nil => 0})
      expect(prospect.contents).to eq({nil => 0})
    end

    it 'can count the contents' do
      expect(prospect.count_them).to eq(0)
      prospect.add({"1" => "1"})
      expect(prospect.count_them).to eq(1)
    end

    it 'can adjust prospect data' do
      prospect.adjust({"1"=> 1})
      expect(prospect.contents).to eq({})
    end

    it 'can take details of contents' do
      expect(prospect.details).to eq([])
    end

    it 'can return prospect info struct' do
      business
      info = prospect.prospect_info(1, 1)
      expect(info.class).to eq(OpenStruct)
    end


  end
end
