require 'rails_helper'

RSpec.describe Prospects, type: :model do
  context 'with valid params' do
    let(:prospect){
      Prospects.new({})
    }

    xit 'can add contents' do
      prospect.add({1 => 1})
      expect(prospect.contents).to eq({"1" => 1})
    end

    xit 'can count the contents' do
      prospect.add({"1" => 1})
      prospect.add({"2" => 1})
      prospect.add({"3" => 1})
      expect(prospect.count_them).to eq(3)
    end

  end
end
